import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/booking/views/tour_request_view.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../home/view/home.dart';

class BookingTourView extends StatefulWidget {
  static String routePath = '/booking-tour';

  const BookingTourView({super.key});

  @override
  State<BookingTourView> createState() => _BookingTourViewState();
}

class _BookingTourViewState extends State<BookingTourView> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Book Tour",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: ColorAssets.blackFaded),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorAssets.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorAssets.lightGray.withOpacity(0.5),
                      blurRadius: 1)
                ]),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Information Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: ColorAssets.blackFaded),
                      ),
                    ),
                    _buildFormFields(),
                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 82,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: ColorAssets.white,
                boxShadow: [
                  BoxShadow(color: ColorAssets.lightGray, blurRadius: 3)
                ],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
            child: Center(
              child: customTextButton(
                  context: context,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: ColorAssets.white),
                      ),
                    ],
                  ),
                  onTap: () {
                    //ontap
                    context.push(TourRequestView.routePath);
                  }),
            ),
          ),

          // button
        ],
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
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Email",
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
                    hintText: "tarachoudhary@gmail.com",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.blackFaded),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
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
          const SizedBox(height: 25),
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
                      margin: const EdgeInsets.only(left: 0, right: 4),
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
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Country",
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
                  value: 'I',
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      value: 'I',
                      child: Text(
                        "India",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.blackFaded,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "U",
                      child: Text(
                        "US",
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
        ],
      ),
    );
  }
}
