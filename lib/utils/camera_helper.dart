import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:s3_image_upload/utils/strings.dart';
import 'package:s3_image_upload/widgets/custom_snackbar.dart';

import '../widgets/custom_dialog.dart';

typedef PhotoCallback = void Function(CroppedFile foo);

Future<CroppedFile?> openCameraFromDevice() async {
  CroppedFile? file;
  // Step #1: Open camera after checking permission.
  await Camera.cropImage().then((pickedFile) async {
    // Step #2: Check if we actually picked an image. Otherwise -> stop;
    if (pickedFile == null) {
      return;
    } else {
      file = pickedFile;
      final double imageSize = file!.path.length / (1024 * 1024); // Size in MB
      if (imageSize > 20) {
        CustomSnackBar.show('Image size should be less than 20MB');
        return;
      }
    }
  });
  return file;
}

class Camera {
  /// Open camera and crop image
  /// Will not work on simulators
  static Future<CroppedFile?> cropImage() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      XFile? file = await ImagePicker().pickImage(
          source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
      return imageCropper(file);
    } else if (status.isPermanentlyDenied || status.isDenied) {
      CustomDialogueBox.show(AppStrings.cameraPermissionMessage, Colors.red,
          AppStrings.goToSettings, Colors.white, () async {
        if (Platform.isAndroid || Platform.isIOS) {
          await openAppSettings();
        }
      });
    }
    return null;
  }

  static Future<CroppedFile?> imageCropper(XFile? file) async {
    return await ImageCropper().cropImage(
      sourcePath: file!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: AppStrings.imageCropper,
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
            title: AppStrings.imageCropper,
            aspectRatioLockEnabled: false,
            minimumAspectRatio: 16 / 9,
            resetButtonHidden: false),
      ],
    );
  }
}
