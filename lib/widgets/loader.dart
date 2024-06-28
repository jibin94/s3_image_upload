import 'package:flutter/material.dart';
import 'package:s3_image_upload/screens/base_page/base_page_ui.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
          child: const CircularProgressIndicator(),
        ));
  }
}
