import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/simple_app_bar.dart';
import 'package:flutter_riverpod_base/src/feature/booking/views/tour_request_view.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/customElevatedContainer.dart';
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
     appBar: SimpleAppBar(
  title: "Book Tour",
  leadingCallback: () => Navigator.pop(context),
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
                    _buildFormFields(context),
                  ],
                ),
              ),
            ),
          ),

          CustomElevatedContainer(
            buttonText: "Continue",
            onTap: () {
              context.push(TourRequestView.routePath);
            },
          )
          // button
        ],
      ),
    );
  }

  _buildFormFields(BuildContext context) {
        final color = Theme.of(context).colorScheme;

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
                    color: color.secondary,
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
                    color:  color.secondary,
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
                       ),
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
                  color:  color.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
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
                        items: const [DropdownMenuItem(child: Text("+91"))],
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
                  color:  color.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  value: 'I',
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: const [
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
