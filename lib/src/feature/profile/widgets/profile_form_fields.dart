import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
import 'package:go_router/go_router.dart';

class ProfileFormFields extends StatelessWidget {
  const ProfileFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormTextField(
            labelText: "Name",
            hintText: "Tara Choudhary",
          ),
          FormTextField(
            labelText: "Gender",
            child: DropdownButton(
              value: 'f',
              underline: const SizedBox(),
              
              isExpanded: true,
              items: [
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
          FormTextField(
            labelText: "Phone Number",
            child: Row(
              children: [
                DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorAssets.blackFaded,
                  ),
                  underline: const SizedBox(),
                  items: [const DropdownMenuItem(child: Text("+91"))],
                  onChanged: (val) {},
                ),
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 5),
                  height: 20,
                  width: 2,
                  color: ColorAssets.black,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                      hintText: "1234567890",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 67),
            child: CustomTextButton(
              bgColor: ColorAssets.primaryBlue,
              text: "Complete Profile",
              ontap: () {
                context.push(HomeView.routePath);
              },
            ),
          ),
        ],
      ),
    );
  }
}
