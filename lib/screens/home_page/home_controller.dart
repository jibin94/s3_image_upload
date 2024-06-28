import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:s3_image_upload/api/connectivity_service.dart';
import 'package:s3_image_upload/api/constants.dart';
import 'package:s3_image_upload/api/repository/api_repository.dart';
import 'package:s3_image_upload/utils/strings.dart';
import 'package:s3_image_upload/widgets/custom_snackbar.dart';

import '../../utils/shared_pref_keys.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  SharedPreferencesService? sharedPrefService;
  TextEditingController imageName = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  FocusNode imageNameNode = FocusNode();
  var isUploading = false.obs;
  var isImagePicked = false.obs;
  var imagePath = ''.obs;
  XFile? selectedImage;

  @override
  void onInit() async {
    super.onInit();
    sharedPrefService = await SharedPreferencesService.instance;
  }

  Future<void> setImage(CroppedFile photo) async {
    imagePath.value = photo.path;
    selectedImage = XFile(photo.path);
    isImagePicked.value = true;
    refresh();
  }

  void deleteImage() {
    imagePath.value = '';
    isImagePicked.value = false;
    refresh();
  }

  void uploadSelectedFile() async {
    if (await ConnectivityService.isConnected()) {
      isUploading.value = true;
      try {
        final Map<String, String> headers = {
          'Content-Type': 'image/jpeg',
          'keyId': APIData.awsKey,
          'accessKey': APIData.accessKey,
          'region': APIData.region,
          'serviceName': "s3"
        };

        String url =
            "${APIData.baseUrl}+${APIData.bucketName}/${selectedImage!.name}";
        var response = await ApiRepo()
            .uploadImage(headers: headers, url: url, imageFile: selectedImage);
        isUploading.value = false;

        if (response.statusCode == 200) {
          CustomSnackBar.show('Image uploaded successfully!');
        } else {
          CustomSnackBar.show(
              'Failed to upload image. Status code: ${response.statusCode}');
        }
      } on DioException catch (_) {
        isUploading.value = false;
      }
    } else {
      isUploading.value = false;
      CustomSnackBar.show(AppStrings.noInternetMessage);
    }
  }
}
