import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/custom_tab_builder.dart';
import 'package:flutter_svg/svg.dart';

import '../sheet/add_review_model.dart';

class ReviewTab extends StatefulWidget {
  const ReviewTab({super.key});

  @override
  State<ReviewTab> createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.blackFaded),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 14,
                          color: ColorAssets.primaryBlue,
                        ),
                        GestureDetector(
                          onTap: () => openReviewModelSheet(context),
                          child: Text(
                            "add reviews",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorAssets.primaryBlue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 17, vertical: 6),
                      decoration: BoxDecoration(
                          color: ColorAssets.lightBlueGray,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.tune,
                            color: ColorAssets.blackFaded,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: ColorAssets.blackFaded,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 17, vertical: 6),
                      decoration: BoxDecoration(
                          color: ColorAssets.primaryBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: ColorAssets.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // reviews

          const Divider(height: 1),

          _reviewBuilder(review: [
            ReviewModel(
                name: "Dale Thiel",
                image: ImageAssets.profileImageJpeg,
                description:
                    "Discover our state-of-the-art Photography Studio, a haven for photographers and creatives a like. ",
                rating: 4.0,
                time: '11 Months ago'),
            ReviewModel(
                name: "John Doe",
                image: ImageAssets.profileImageJpeg,
                description:
                    "Discover our state-of-the-art Photography Studio, a haven for photographers and creatives a like. ",
                rating: 4.0,
                time: '11 Months ago'),
          ])
        ],
      ),
    );
  }

  _reviewBuilder({required List<ReviewModel> review}) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: ColorAssets.lightGray))),
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 17, top: 17),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(ImageAssets.profileImageJpeg),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            review[index].name,
                            style: TextStyle(
                              color: ColorAssets.blackFaded,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            review[index].time,
                            style: TextStyle(
                              color: ColorAssets.lightGray,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      review[index].description,
                      softWrap: true,
                      style: TextStyle(
                        color: ColorAssets.lightGray,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    //raiting
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rate,
                          size: 16,
                          color: ColorAssets.yellow,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          review[index].rating.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: ColorAssets.lightGray),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: review.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  void openReviewModelSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: ColorAssets.white,
    
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return 
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height - 200,
              decoration:  BoxDecoration(
                  
              color: ColorAssets.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: AddReviewModel(),
            )
        ;
        });
  }
}

class ReviewModel {
  final String name;
  final String time;
  final String image;
  final String description;
  final double rating;

  ReviewModel(
      {required this.name,
      required this.time,
      required this.image,
      required this.description,
      required this.rating});
}
