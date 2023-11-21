import 'package:flutter/material.dart';

import '../res/colors.dart';

InkWell customTextButton({required BuildContext context,required Widget child,required VoidCallback onTap})   {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorAssets.primaryBlue,
          borderRadius: BorderRadius.circular(20)),
      child: child,
      
    ),
  );
}
