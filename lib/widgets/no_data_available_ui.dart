import 'package:flutter/material.dart';

import '../utils/colors.dart';

class NoDataUI extends StatelessWidget {
  final String text;

  const NoDataUI({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.lightGreyTextColor),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
