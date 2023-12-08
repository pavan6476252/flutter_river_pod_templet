import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/auth/login_page.dart';
import 'package:flutter_riverpod_base/src/feature/auth/widgets/header_builder.dart';
import 'package:flutter_riverpod_base/src/feature/auth/widgets/social_login_buttons.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';

import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../commons/views/location_access/location_access_page.dart';

class SignUpPage extends StatelessWidget {
  static String routePath = '/signup-page';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: ColorAssets.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthenticationPageHeaderBuilder(
                      title: "Sign Up", subtitle: "Create Your Account"),
                  _formFields(),
                  CustomTextButton(
                      text: "Sign Up",
                      ontap: () {
                        context.push(LocationAccessPage.routePath);
                      }),
                  SocialAuthenticationButtons(
                    widget: RichText(
                      text: TextSpan(
                          text: "Alredy have an account?",
                          style: textTheme.titleLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: " Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(LoginPage.routePath);
                                },
                              style: textTheme.titleLarge!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formFields() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormTextField(
            labelText: "Name",
            hintText: "Tara Choudhary",
          ),
          FormTextField(
            labelText: "Email",
            hintText: "example@gmail.com",
          ),
          FormTextField(
            labelText: "Password",
            enableObsecure: true,
            hintText: "* * * * * * * ",
          ),
          FormTextField(
            labelText: "Confirm Password",
            enableObsecure: true,
            hintText: "* * * * * * * ",
          ),
        ],
      ).addSpacingBetweenElements(15),
    );
  }
}
