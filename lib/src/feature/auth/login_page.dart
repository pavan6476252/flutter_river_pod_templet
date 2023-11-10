

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/views/location_access/location_access_page.dart';
import 'package:flutter_riverpod_base/src/feature/auth/sign_up_page.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  static String routePath = '/login-page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _headerBuilder(
                      title: "Login",
                      subtitle: "Hi! Welcome back, nice to see you"),
                  _formFields(),
                  customButton(
                      context: context,
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorAssets.white,
                            fontWeight: FontWeight.w600),
                      )),
                      onTap: () {
// temporary navigation to location access
                        context.push(LocationAccessPage.routePath);
                      }),
                  _socialLoginMethods(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _headerBuilder({required String title, required String subtitle}) {
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

  _formFields() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  color: ColorAssets.lightBlueGray,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorAssets.lightGray),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  color: ColorAssets.lightBlueGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    ImageAssets.privacyIcon,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorAssets.redAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  _socialLoginMethods(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 1,
                color: ColorAssets.lightGray,
              )),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "or Sign in with",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorAssets.lightGray),
                ),
              ),
              Expanded(
                  child: Divider(
                thickness: 1,
                color: ColorAssets.lightGray,
              )),
            ],
          ),

          // social buttons
          SizedBox(height: 30),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    ImageAssets.google,
                    width: 40,
                    height: 40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    ImageAssets.facebook,
                    width: 40,
                    height: 40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    ImageAssets.apple,
                    width: 40,
                    height: 40,
                  )),
            ],
          ),
          SizedBox(height: 50),
          RichText(
            text: TextSpan(
                text: "Don't have account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorAssets.black,
                ),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push(SignUpPage.routePath);
                        },
                      text: " Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorAssets.primaryBlue,
                      ))
                ]),
          )
        ],
      ),
    );
  }
}
