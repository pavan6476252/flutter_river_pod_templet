import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/feature/profile/widgets/profile_form_fields.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
import 'package:go_router/go_router.dart';

class CompleteYourProfileInfoView extends StatefulWidget {
  static String routePath = '/complete-profile-info';

  const CompleteYourProfileInfoView({super.key});

  @override
  State<CompleteYourProfileInfoView> createState() =>
      _CompleteYourProfileInfoViewState();
}

class _CompleteYourProfileInfoViewState
    extends State<CompleteYourProfileInfoView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: ColorAssets.white,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 54),
                Text(
                  "Complete Your Profile",
                  style: textTheme.titleLarge!.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    // color: ColorAssets.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Don’t worry, only you can see your personal data. No one else will be able to see it.",
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: color.tertiary),
                ),
                _profilePickBuilder(context),
                ProfileFormFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _profilePickBuilder(BuildContext context) {
        final color = Theme.of(context).colorScheme;

    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color:  color.secondary, shape: BoxShape.circle),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Icon(
              Icons.person,
              size: 80,
              color: ColorAssets.lightGray,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorAssets.primaryBlue,
              ),
              width: 32,
              height: 32,
              child: Icon(
                Icons.edit_rounded,
                size: 14,
                color: ColorAssets.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
