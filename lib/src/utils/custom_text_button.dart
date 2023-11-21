import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.bgColor,
      required this.text,
      this.textColor,
      required this.ontap});

  final Color? bgColor;
  final String text;
  final Color? textColor;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor == null ? ColorAssets.primaryBlue : bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: textColor == null ? ColorAssets.white : textColor,
            ),
          ),
        ),
      ),
    );
  }
}
