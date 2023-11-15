import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/booking/sheet/book_a_tour_model.dart';
import 'package:flutter_riverpod_base/src/feature/booking/tabs/about_tab.dart';
import 'package:flutter_riverpod_base/src/feature/booking/tabs/gallery_tab.dart';
import 'package:flutter_riverpod_base/src/feature/booking/tabs/review_tab.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';
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

  toogleLikeButton() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  PageController carouselController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorAssets.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
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
              onTap: (){
              context.pop();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorAssets.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorAssets.lightGray.withOpacity(0.5),
                      blurRadius: 1)
                ]),
            child: const Icon(
              Icons.share,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorAssets.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorAssets.lightGray.withOpacity(0.5),
                      blurRadius: 1)
                ]),
            child: const Icon(
              Icons.favorite_border_rounded,
              size: 20,
            ),
          ),
          const SizedBox(width: 20),
        ],
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
                        indicatorColor: ColorAssets.primaryBlue,
                        indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 6.0, color: ColorAssets.primaryBlue),
                            insets: EdgeInsets.symmetric(horizontal: 60)),
                        // indicatorWeight: 6,
                        unselectedLabelColor: ColorAssets.lightGray,
                        labelColor: ColorAssets.primaryBlue,
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
              body: TabBarView(controller: _tabBarController, children: [
                AboutTab(),
                GalleryTab(),
                ReviewTab(),
              ]))),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorAssets.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 4, spreadRadius: 0, color: ColorAssets.lightGray)
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        height: 82,
        child: ListTile(
          leading: null,
          title: Text(
            "Total Price",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorAssets.lightGray),
          ),
          subtitle: RichText(
            text: TextSpan(
                text: "\$1500",
                style: TextStyle(
                  height: 1.5,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorAssets.primaryBlue),
                children: [
                  TextSpan(
                    text: " /month",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.lightGray),
                  ),
                ]),
          ),
          trailing: SizedBox(
            width: 148,
            height: 42,
            child: GestureDetector(
              onTap: ()=>showTourBookingModel(context),
              child: Container(
                
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorAssets.primaryBlue),
                  child: Center(
                      child: Text(
                    "Book Tour",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ColorAssets.white),
                      ))),
            )
              
          ),
        ),
      ),
    );
  }

  String tag = 'Photography';
  SliverToBoxAdapter _descriptionBuilder() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  SizedBox(width: 18),
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          Text(
            "CaptureVision Studios",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: ColorAssets.blackFaded),
          ),
          SizedBox(height: 12),
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
    return SliverToBoxAdapter(
      child: Container(
        height: 270,
        width: double.maxFinite,
        color: ColorAssets.primaryBlue,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Expanded(
                child: PageView(
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
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SmoothPageIndicator(
                    effect: WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: ColorAssets.white,
                        dotColor: ColorAssets.lightBlueGray.withOpacity(0.5)),
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
          return 
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height - 200,
              decoration:  BoxDecoration(
                  
              color: ColorAssets.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: TourBookingModelSheet(),
            )
        ;
        });
  }

  
}
