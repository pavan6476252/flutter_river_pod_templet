// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/auth/widgets/header_builder.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod_base/src/commons/views/location_access/location_access_page.dart';
import 'package:flutter_riverpod_base/src/feature/auth/sign_up_page.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';

import 'widgets/social_login_buttons.dart';

class LoginPage extends StatelessWidget {
  static String routePath = '/login-page';

  const LoginPage({super.key});

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
                      title: "Login",
                      subtitle: "Hi! Welcome back, nice to see you"),
                  _formFields(context),
                  CustomTextButton(
                      text: "Sign In",
                      ontap: () {
                        context.push(LocationAccessPage.routePath);
                      }),
                  SocialAuthenticationButtons(
                    widget: RichText(
                      text: TextSpan(
                          text: "Don't have account",
                          style: textTheme.titleLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(SignUpPage.routePath);
                                },
                              text: " Sign Up",
                              style: textTheme.titleLarge!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formFields(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FormTextField(
          labelText: 'Email',
          hintText: "example@gmail.com",
        ),
        const FormTextField(
          hintText: ' - - - - - - - - - - ',
          enableObsecure: true,
          labelText: 'Password',
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(
              "Forgot Password",
              style:    TextStyle(
                  decoration: TextDecoration.underline,
                  color:Theme.of(context).colorScheme.error,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    ).addSpacingBetweenElements(12);
  }
}
