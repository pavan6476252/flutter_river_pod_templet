import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

class PrivacyPolicyView extends StatefulWidget {
  static String routePath = '/privacy-policy';
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorAssets.white,
        appBar: AppBar(
            forceMaterialTransparency: true,
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: ColorAssets.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorAssets.lightGray.withOpacity(0.5),
                      blurRadius: 2)
                ],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back),
            ),
            centerTitle: true,
            title: const Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Last Updated: [08-09-2023]',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome to the "Studio on Rent" app, created to help users find and book studio spaces. Your privacy is important to us, and we are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  'Information We Collect:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'Welcome to the "Studio on Rent" app, created to help users find and book studio spaces. Your privacy is important to us, and we are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      text: "Person Information",
                      children: [
                        TextSpan(
                          text:
                              "We collect the information you provide during registration, such as your name, email address, and phone number. Booking",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
