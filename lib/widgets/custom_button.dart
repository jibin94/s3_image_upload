import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Color? iconColor;
  final IconData? icon;
  final String? image;
  final VoidCallback buttonAction;
  const CustomButton(
      {super.key,
      required this.text,
      this.icon,
      this.image,
      required this.buttonColor,
      required this.textColor,
      required this.buttonAction,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonAction,
      child: Container(
        height: getScreenHeight(60.0),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          boxShadow: const [
            BoxShadow(color: AppColors.pageBackground, spreadRadius: 1),
          ],
        ),
        child: icon != null || image != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          color: iconColor,
                          size: 25,
                        )
                      : SizedBox(
                          height: 16,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Image.asset(
                              image!,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                  ScreenUtil.kWidth30(),
                  Text(text,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor)),
                ],
              )
            : Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor)),
      ),
    );
  }
}
