import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/simple_app_bar.dart';
import 'package:flutter_riverpod_base/src/feature/booking/sheet/book_a_tour_model.dart';
import 'package:flutter_riverpod_base/src/feature/booking/tabs/about_tab.dart';
import 'package:flutter_riverpod_base/src/feature/booking/tabs/gallery_tab.dart';
import 'package:flutter_riverpod_base/src/feature/booking/tabs/review_tab.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/sharing_utils.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/customElevatedContainer.dart';

import 'package:flutter_riverpod_base/src/utils/widgets/custom_tab_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../commons/views/help-center/help_center_view.dart';

class BookingView extends StatefulWidget {
  static String routePath = '/booking-view';

  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView>
    with SingleTickerProviderStateMixin {
  late TabController _tabBarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
  }

  bool isLiked = false;

  toggleLikeButton() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  PageController carouselController = PageController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: ColorAssets.white,
        // appBar: AppBar(
        //   forceMaterialTransparency: true,
        //   backgroundColor: Colors.transparent,
        //   leading: Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: Container(
        //       width: 20,
        //       height: 20,
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: ColorAssets.white,
        //           boxShadow: [
        //             BoxShadow(
        //                 color: ColorAssets.lightGray.withOpacity(0.5),
        //                 blurRadius: 1)
        //           ]),
        //       child: GestureDetector(
        //         onTap: () {
        //           context.pop();
        //         },
        //         child: const Icon(
        //           Icons.arrow_back,
        //           size: 20,
        //         ),
        //       ),
        //     ),
        //   ),
        //   actions: [
        //     Container(
        //       width: 30,
        //       height: 30,
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: color.background,
        //           boxShadow: [
        //             BoxShadow(
        //                 color: ColorAssets.lightGray.withOpacity(0.5),
        //                 blurRadius: 1)
        //           ]),
        //       child: const Icon(
        //         Icons.share,
        //         size: 20,
        //       ),
        //     ).onTap(() {
        //       SharingUtils.shareStudioScrenshotContent(
        //           context: context,
        //           text: "CaptureVision Studios",
        //           subject: "Aram Cottage,Pune ,Maharastra");
        //     }),
        //     const SizedBox(width: 10),
        //     Container(
        //       width: 30,
        //       height: 30,
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color:color.background,
        //           boxShadow: [
        //             BoxShadow(
        //                 color: ColorAssets.lightGray.withOpacity(0.5),
        //                 blurRadius: 1)
        //           ]),
        //       child: Icon(
        //         isLiked ? Icons.favorite : Icons.favorite_border_rounded,
        //         color:
        //             isLiked ? color.primary:null,
        //         size: 16,
        //       ),
        //     ).onTap(() {
        //       toggleLikeButton();
        //     }),
        //     const SizedBox(width: 20),
        //   ],
        // ),
        appBar: SimpleAppBar(title:"" ,titleWidget: null,),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: CustomElevatedContainer(
            buttonText: "Total Price",
            onTap: () {
              showTourBookingModel(context);
            },
            price: "\$1500",
          ),
        ),
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    _imageCarouselBuilder(),
                    _descriptionBuilder(),
                    SliverPersistentHeader(
                      delegate: SliverAppBarDelegate(
                        TabBar(
                          controller: _tabBarController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: color.primary,
                          indicator: UnderlineTabIndicator(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 6.0, color: color.primary),
                              insets:
                                  const EdgeInsets.symmetric(horizontal: 60)),
                          // indicatorWeight: 6,
                          unselectedLabelColor: ColorAssets.lightGray,
                          labelColor: color.primary,
                          tabs: const [
                            Tab(text: " About "),
                            Tab(text: " Gallery"),
                            Tab(text: " Review "),
                          ],
                        ),
                      ),

                      pinned: true,
                      // floating: true,
                    ),
                  ];
                },
                body:
                    TabBarView(controller: _tabBarController, children: const [
                  AboutTab(),
                  GalleryTab(),
                  ReviewTab(),
                ]))));
  }

  String tag = 'Photography';
  SliverToBoxAdapter _descriptionBuilder() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        width: double.maxFinite,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTagBuilder(tag: tag),
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
    );
  }

  SliverToBoxAdapter _imageCarouselBuilder() {
    final color = Theme.of(context).colorScheme;

    return SliverToBoxAdapter(
      child: Container(
        height: 270,
        width: double.maxFinite,
        color: color.primary,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              controller: carouselController,
              children: [
                Image.asset(
                  ImageAssets.studio,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  ImageAssets.studio1,
                  fit: BoxFit.cover,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SmoothPageIndicator(
                    effect: WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: ColorAssets.white,
                        dotColor:  color.secondary.withOpacity(0.5)),
                    controller: carouselController,
                    count: 2),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showTourBookingModel(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: ColorAssets.white,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
                color: ColorAssets.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: const TourBookingModelSheet(),
          );
        });
  }
}
