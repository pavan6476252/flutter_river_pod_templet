import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_base/src/feature/booking/booking_view.dart';
import 'package:flutter_riverpod_base/src/feature/home/near_by_studios_view.dart';
import 'package:flutter_riverpod_base/src/feature/home/recomended_studios_view.dart';
import 'package:flutter_riverpod_base/src/feature/home/widgets/app_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../res/colors.dart';
import '../../../res/data.dart';
import '../../../utils/widgets/item_card_view.dart';
import '../../../utils/widgets/item_list_tile_view.dart';
import '../widgets/categories_horizontal_list_view.dart';
import '../widgets/custom_search_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      
      slivers: [
      const SliverAppBar(
          leading: SizedBox.shrink(),
          expandedHeight: kToolbarHeight + 80,
          floating: false,
          pinned: true, 
          scrolledUnderElevation: 0,
          collapsedHeight: kToolbarHeight + 80,
          flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: Column(
                children: [
                  HomeViewAppBar(),
                  CustomSearchBar(),
                ],
              ))),
      SliverToBoxAdapter(
        child: Column(
          children: [
            const CategoriesHorizontalListView(),
            _recomendationsListView(),
            _nearbyListView(),
          ],
        ),
      ),
    ]);
  }

  _headerBuilder({required String title, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorAssets.black),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "See all",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorAssets.primaryBlue),
          ),
        )
      ],
    );
  }

  _recomendationsListView() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: _headerBuilder(
              title: "Recomended Studio",
              onTap: () {
                context.push(RecommendedStudiosView.routePath,
                    extra: AppData.recomendedStudios);
              }),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 254,
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: AppData.recomendedStudios.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final data = AppData.recomendedStudios[index];
              return Container(
                padding: EdgeInsets.only(
                    left: index == 0 ? 20 : 0, right: 10, top: 2, bottom: 2),
                child: ItemCardView(
                    studioModel: data,
                    onClick: () {
                      context.push(BookingView.routePath);
                    }),
              );
            },
          ),
        ),
      ],
    );
  }

  _nearbyListView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          _headerBuilder(
              title: "Nearby Studios",
              onTap: () {
                context.push(NearbyStudiosView.routePath,
                    extra: AppData.recomendedStudios);
              }),
          ListView.builder(
            itemCount: AppData.recomendedStudios.length,
            // scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final data = AppData.recomendedStudios[index];
              return Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: ItemListTileView(studioModel: data),
              );
            },
          ),
        ],
      ),
    );
  }
}
