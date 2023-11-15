import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';
import 'package:go_router/go_router.dart';

class CompleteYourProfileInfoView extends StatefulWidget {
  static String routePath = '/complete-profile-info';

  const CompleteYourProfileInfoView({super.key});

  @override
  State<CompleteYourProfileInfoView> createState() => _CompleteYourProfileInfoViewState();
}

class _CompleteYourProfileInfoViewState extends State<CompleteYourProfileInfoView> {
  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Complete Your Profile",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  "Don’t worry, only you can see your personal data. No one else will be able to see it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorAssets.lightGray,
                      fontWeight: FontWeight.w500),
                ),
                _profilePickBuilder(context),
                _buildFormFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFormFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: ColorAssets.lightBlueGray,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tara Choudhary",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.blackFaded),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gender",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
       
    Container(
      height: 54,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: ColorAssets.lightBlueGray,
        borderRadius: BorderRadius.circular(10),
      ),
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
  ],
),

          const SizedBox(height: 30),
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
                    color: ColorAssets.lightBlueGray,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    DropdownButton(
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorAssets.blackFaded),
                        underline: const SizedBox(),
                        items: [const DropdownMenuItem(child: Text("+91"))],
                        onChanged: (val) {}),
                 Container(
                  margin: const EdgeInsets.only(left: 0,right: 4),
                  height: 20,width: 2,color: ColorAssets.black,),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                          hintText: "1234567890",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 67),
                child: customButton(
                    context: context,
                    child: Center(
                        child: Text(
                      "Complete Profile",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.white),
                    )),
                    onTap: () {
                      context.push(HomeView.routePath);
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  _profilePickBuilder(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: ColorAssets.lightBlueGray, shape: BoxShape.circle),
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
