import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s3_image_upload/screens/base_page/base_page_controller.dart';

import '../../utils/colors.dart';

double screenHeight = 0;
double screenWidth = 0;

class BasePage extends GetView<BasePageController> {
  final Widget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? customDrawer;
  final double? customHeight;
  final bool? isLoaderShown;

  final Widget? floatingActionButton;
  const BasePage(
      {super.key,
      required this.body,
      this.floatingActionButton,
      this.appBar,
      this.customDrawer,
      this.customHeight,
      this.bottomNavigationBar,
      this.isLoaderShown});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height:
          customHeight == null ? screenHeight : screenHeight - customHeight!,
      color: AppColors.selectedButtonColor,
      child: SafeArea(
        minimum: const EdgeInsets.all(0),
        maintainBottomViewPadding:
            false, //To get below notch same color as bottom tab bar
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset:
              false, //To avoid screen height issues on keyboard appearance
          appBar: appBar != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(100), child: appBar!)
              : PreferredSize(preferredSize: Size.zero, child: Container()),
          body: Container(
            color: AppColors.pageBackground,
            child: Stack(
              children: [
                body,
              ],
            ),
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          drawer: customDrawer,
        ),
      ),
    );
  }
}
