

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

class AuthenticationPageHeaderBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthenticationPageHeaderBuilder({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: ColorAssets.black),
          ),
          SizedBox(height: 14),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorAssets.lightGray),
          )
        ],
      ),
    );
  }
}
