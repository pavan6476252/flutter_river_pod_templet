import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod_base/src/feature/auth/login_page.dart';
import 'package:flutter_riverpod_base/src/feature/auth/sign_up_page.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../res/assets.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Positioned(
            top: 88,
            left: 66,
            child: Image.asset(
              ImageAssets.page3,
              width: 290,
              height: 477,
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Expanded(child: SizedBox()),
              // Container(
              //     height: 10,
              //     width: double.maxFinite,
              //     decoration: BoxDecoration(
              //       border: Border(top: BorderSide(color: ColorAssets.lightGray.withOpacity(0.1) )),
              //       boxShadow: [
              //         BoxShadow(
              //           offset: Offset(0, -10),
              //           blurRadius: 12,
              //           spreadRadius: 0,
              //           color: Color.fromRGBO(0, 0, 0, 0.219),
              //         ),
              //       ],
              //     )),
              Expanded(
                  child: Material(
                elevation: 15,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Discovery",
                            children: [
                              TextSpan(
                                  text: " and Find Your\n",
                                  style: textTheme.titleLarge!.copyWith(
                                      color: ColorAssets.black, fontSize: 26)),
                              TextSpan(
                                  text: "Perfect Studio",
                                  style: textTheme.titleLarge!.copyWith(
                                      color: ColorAssets.primaryBlue,
                                      fontSize: 26)),
                            ],
                            style: textTheme.titleLarge!.copyWith(
                                color: ColorAssets.primaryBlue, fontSize: 26)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      // description
                      Text(
                        "App to search and discover the most suitable place for you to stay",
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium!.copyWith(
                            color: ColorAssets.lightGray,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 30),
                      customTextButton(
                          context: context,
                          child: Center(
                            child: Text(
                              "Let’s Get Started",
                              style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: ColorAssets.white),
                            ),
                          ),
                          onTap: () {
                            context.push(SignUpPage.routePath);
                          }),
                      const SizedBox(height: 30),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorAssets.black,
                              fontSize: 20),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: textTheme.titleLarge!.copyWith(
                                  color: ColorAssets.primaryBlue, fontSize: 20),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(LoginPage.routePath);
                                },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
