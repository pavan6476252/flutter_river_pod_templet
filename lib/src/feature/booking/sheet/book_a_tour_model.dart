import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod_base/src/feature/booking/views/book_tour_view.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
 
import 'package:flutter_riverpod_base/src/utils/custom_text_button.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/custom_tab_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TourBookingModelSheet extends StatefulWidget {
  const TourBookingModelSheet({super.key});

  @override
  State<TourBookingModelSheet> createState() => _TourBookingModelSheetState();
}

class _TourBookingModelSheetState extends State<TourBookingModelSheet> {
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
    selectedDate = DateTime.now();
  }

  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorAssets.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.maxFinite,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomTagBuilder(tag: 'Photography'),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '4.8 (300 reviews)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ColorAssets.lightGray),
                                  ),
                                  const SizedBox(width: 18),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "CaptureVision Studios",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: ColorAssets.blackFaded),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Aram Cottage,Pune, Maharashtra",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorAssets.blackFaded),
                          ),
                        ]),
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Book Tour",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.lightGray,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Day",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.blackFaded,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // time selecting
                  Container(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (context, index) {
                        final currentDate =
                            selectedDate.add(Duration(days: index));
                        final formattedDate =
                            DateFormat('d MMM').format(currentDate);
                        final day = DateFormat('E').format(currentDate);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = currentDate;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedDate.day == currentDate.day
                                  ? ColorAssets.primaryBlue
                                  : ColorAssets.lightBlueGray,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  day,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: selectedDate.day == currentDate.day
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: selectedDate.day == currentDate.day
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // time selecting
                  const SizedBox(height: 30),

                  // time selecting
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Time",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.blackFaded,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (context, index) {
                        final currentTime = TimeOfDay(hour: index, minute: 0);
                        final formattedTime =
                            "${_formatHour(currentTime.hour)}:${currentTime.minute == 0 ? '00' : '30'} ${_getAmPm(currentTime)}";

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTime = currentTime;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedDate.day == currentTime.hour
                                  ? ColorAssets.primaryBlue
                                  : ColorAssets.lightBlueGray,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: selectedDate.day == currentTime.hour
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                    padding: EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: ColorAssets.primaryBlue, width: 3))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Want a custom scheduler?",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ColorAssets.blackFaded),
                        ),
                        Text(
                          "Request Schedule",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ColorAssets.primaryBlue),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          // submit button

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
              child: CustomTextButton(
                  text: "Schedule Tour",
                  // textAlign: TextAlign.center,
                  ontap: () {
                    //ontap
                    context.push(BookingTourView.routePath);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  String _formatHour(int hour) {
    return hour > 12 ? (hour - 12).toString() : hour.toString();
  }

  String _getAmPm(TimeOfDay time) {
    return time.hour >= 12 ? 'PM' : 'AM';
  }
}
