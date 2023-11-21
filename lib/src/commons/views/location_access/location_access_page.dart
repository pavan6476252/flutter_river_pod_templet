import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/views/location_access/widgets/manual_location_access_sheet.dart.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/complete_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';

import 'package:go_router/go_router.dart';

class LocationAccessPage extends StatelessWidget {
  static String routePath = '/location-access';

  const LocationAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                  color: ColorAssets.lightBlueGray, shape: BoxShape.circle),
              child: Icon(
                Icons.location_on_rounded,
                size: 80,
                color: ColorAssets.primaryBlue,
              ),
            ),
            Text(
              "What is Your Location?",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: ColorAssets.black),
            ),
            Text(
              "We need to know your location in order to suggest nearby  services.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorAssets.lightGray),
            ),
            CustomTextButton(
                text: "Allow Location Accss",
                ontap: () {
                  context.push(CompleteYourProfileInfoView.routePath);
                }),
            Text(
              "Enter Location Manually",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorAssets.primaryBlue),
            ).onTap(() {
              showLoactionAccessingBottomModelSheet(context);
            }),
          ],
        ).addSpacingBetweenElements(15),
      ),
    );
  }
}
