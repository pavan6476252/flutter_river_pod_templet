import 'package:flutter/material.dart';
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
    return  SingleChildScrollView(
      child: Column(
        children: [
    
          CustomSearchBar(),
          CategoriesHorizontalListView(),
           _headerBuilder(title: "Recomended Studio", onTap: () {
            context.push(RecommendedStudiosView.routePath,extra:AppData.recomendedStudios );
           }),
        _recomendationsListView(),
        _headerBuilder(title: "Nearby Studios", onTap: () {
            context.push(NearbyStudiosView.routePath,extra:AppData.recomendedStudios );
        }),
        _nearbyListView(),

        ]));
  }
  _headerBuilder({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorAssets.black),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "See all",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorAssets.primaryBlue),
            ),
          )
        ],
      ),
    );
  }

  _recomendationsListView() {
    return Container(
      height: 254,
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: AppData.recomendedStudios.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = AppData.recomendedStudios[index];
          return Container(
            padding:
                EdgeInsets.only(left: index == 0 ? 22 : 30, top: 2, bottom: 2),
            child: ItemCardView(studioModel: data),
          );
        },
      ),
    );
  }

  _nearbyListView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: AppData.recomendedStudios.length,
        // scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = AppData.recomendedStudios[index];
          return Container(
            padding: EdgeInsets.only(
              top: index == 0 ? 0 : 20,
            ),
            child: ItemListTileView(studioModel: data),
          );
        },
      ),
    );
  }
}