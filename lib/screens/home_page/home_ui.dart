import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s3_image_upload/utils/camera_helper.dart';
import 'package:s3_image_upload/utils/strings.dart';
import 'package:s3_image_upload/widgets/custom_button.dart';
import 'package:s3_image_upload/widgets/image_widget.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';
import '../../widgets/text_input.dart';
import '../base_page/base_page_ui.dart';
import 'home_controller.dart';

class HomePageUi extends GetView<HomePageController> {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => BasePage(body: bodyContainer(keyboardVisible)),
    );
  }

  Widget bodyContainer(bool keyboardVisible) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "AWS-S3-Image-Upload",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
          leading: const SizedBox(),
          iconTheme: const IconThemeData(color: AppColors.selectedButtonColor),
          backgroundColor: AppColors.selectedButtonColor,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ScreenUtil.kHeight20(),
                TextInputs(
                  key: Key(AppStrings.imageText),
                  label: AppStrings.imageText,
                  identifier: AppStrings.imageText,
                  textInputType: TextInputType.name,
                  isPassword: false,
                  textEditingController: controller.imageName,
                  focusNode: controller.imageNameNode,
                  nextFocus: () {},
                ),
                ScreenUtil.kHeight30(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Obx(
                    () => ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          ImageWidget(
                            path: controller.imagePath.value,
                            aspectRatio: 16 / 9,
                            title: "Upload Image",
                            buttonAction: () {
                              openCameraFromDevice().then((photo) {
                                if (photo == null) {
                                  return;
                                } else {
                                  controller.setImage(photo);
                                }
                              });
                            },
                          ),
                          Positioned(
                            bottom: 5,
                            right: 12,
                            child: InkWell(
                              onTap: () {
                                if (controller.isImagePicked.value) {
                                  controller.deleteImage();
                                } else {
                                  openCameraFromDevice().then((photo) {
                                    if (photo == null) {
                                      return;
                                    } else {
                                      controller.setImage(photo);
                                    }
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white12,
                                ),
                                child: Icon(
                                  controller.isImagePicked.value
                                      ? Icons.delete
                                      : Icons.upload,
                                  color: AppColors.selectedButtonColor,
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ScreenUtil.kHeight30(),
                controller.isUploading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: AppStrings.upload,
                        buttonAction: () => controller.uploadSelectedFile(),
                        buttonColor: controller.isImagePicked.value
                            ? AppColors.selectedButtonColor
                            : AppColors.greyTextColor,
                        textColor: AppColors.buttonTextColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
