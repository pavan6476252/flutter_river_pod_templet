import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';

import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileInfoView extends StatefulWidget {
  static String routePath = '/edit-profile-info';

  const EditProfileInfoView({super.key});

  @override
  State<EditProfileInfoView> createState() => _EditProfileInfoViewState();
}

class _EditProfileInfoViewState extends State<EditProfileInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorAssets.white,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _profilePickBuilder(context),
                      _buildFormFields(context),
                    ],
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: CustomTextButton(
                    text: "Update Profile",
                    ontap: () {
                      context.push(HomeView.routePath);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildFormFields(BuildContext context) {   final color = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormTextField(
            labelText: "Name",
            hintText: "Tara Choudhary",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Phone Number",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color:  color.secondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "98188456800",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorAssets.blackFaded),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Change",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorAssets.primaryBlue),
                        ))
                  ],
                ),
              )
            ],
          ),
          // email
          const FormTextField(
            labelText: "Email",
            hintText: "example@gmail.com",
          ),
          // gender
          FormTextField(
            labelText: "Gender",
            child: DropdownButton(
              value: 'f',
              underline: const SizedBox(),
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'f',
                  child: Text(
                    "Female",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorAssets.blackFaded,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "m",
                  child: Text(
                    "Male",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorAssets.blackFaded,
                    ),
                  ),
                ),
              ],
              onChanged: (data) {},
            ),
          ),
          const FormTextField(
            labelText: "DOB",
            hintText: "DD/MM/YY",
          ),

          // button
        ],
      ).addSpacingBetweenElements(20),
    );
  }

  File? pickedImage;

  _pickImage() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      pickedImage = File(img.path);
      setState(() {});
    }
  }

  _profilePickBuilder(BuildContext context) {
        final color = Theme.of(context).colorScheme;

    return Container(
      width: 100,
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(

              radius: 50,
              backgroundImage:
                  pickedImage != null ? FileImage(pickedImage!) : null),
            Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.edit,
                size: 18,
                color: color.primary,
              ),
              Text(
                "EDIT",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: color.primary,
                    fontSize: 18),
              )
            ],
          ).onTap(_pickImage)
        ],
      ),
    );
  }
}
