import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/complete_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';
import 'package:go_router/go_router.dart';

class LocationAccessPage extends StatelessWidget {
  static String routePath = '/location-access';

  const LocationAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 95),
              Container(
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    color: ColorAssets.lightBlueGray, shape: BoxShape.circle),
                child: Icon(
                  Icons.location_on_rounded,
                  size: 80,
                  color: ColorAssets.primaryBlue,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "What is Your Location?",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: ColorAssets.black),
              ),
              SizedBox(height: 15),
              Text(
                "We need to know your location in order to suggest nearby  services.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorAssets.lightGray),
              ),
              SizedBox(height: 30),
              customButton(
                  context: context,
                  child: Center(
                    child: Text(
                      "Allow Location Access",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.white),
                    ),
                  ),
                  onTap: () {
                    context.push(CompleteYourProfileInfoView.routePath);
                  }),
              SizedBox(height: 30),
              Text(
                "Enter Location Manually",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorAssets.primaryBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
