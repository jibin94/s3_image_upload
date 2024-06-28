import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class BottomAppBarController extends GetxController {
  var selectedValueOnBottomAppBar = "".obs;

  @override
  void onInit() {
    super.onInit();
    selectedValueOnBottomAppBar.value = "";
  }
}

ValueNotifier<String> changedValueNotifier = ValueNotifier(
    ""); //changedValueNotifier gets notified each time user taps on the bottom app bar

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: AppColors.primaryTextFieldColor,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
      ),
    );
  }
}
