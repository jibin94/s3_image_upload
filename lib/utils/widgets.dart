import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenUtil {
  static late BuildContext _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static SizedBox kWidth10() {
    double screenWidth = MediaQuery.of(_context).size.width;
    return SizedBox(width: screenWidth * 0.01);
  }

  static SizedBox kWidth20() {
    double screenWidth = MediaQuery.of(_context).size.width;
    return SizedBox(width: screenWidth * 0.02);
  }

  static SizedBox kWidth30() {
    double screenWidth = MediaQuery.of(_context).size.width;
    return SizedBox(width: screenWidth * 0.03);
  }

  static SizedBox kWidth50() {
    double screenWidth = MediaQuery.of(_context).size.width;
    return SizedBox(width: screenWidth * 0.05);
  }

  static SizedBox kWidth60() {
    double screenWidth = MediaQuery.of(_context).size.width;
    return SizedBox(width: screenWidth * 0.06);
  }

  static SizedBox kHeight10() {
    double screenHeight = MediaQuery.of(_context).size.height;
    return SizedBox(height: screenHeight * 0.01);
  }

  static SizedBox kHeight20() {
    double screenHeight = MediaQuery.of(_context).size.height;
    return SizedBox(height: screenHeight * 0.02);
  }

  static SizedBox kHeight30() {
    double screenHeight = MediaQuery.of(_context).size.height;
    return SizedBox(height: screenHeight * 0.03);
  }

  static SizedBox kHeight40() {
    double screenHeight = MediaQuery.of(_context).size.height;
    return SizedBox(height: screenHeight * 0.04);
  }

  static SizedBox kHeight50() {
    double screenHeight = MediaQuery.of(_context).size.height;
    return SizedBox(height: screenHeight * 0.05);
  }
}

double getScreenHeight(heightValue) {
  // The equivalent of the "smallestWidth" qualifier on Android.
  //600  is a common breakpoint for a typical 7-inch tablet.
  final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first);
  return data.size.shortestSide > 600 ? heightValue + 4 : heightValue;
}
