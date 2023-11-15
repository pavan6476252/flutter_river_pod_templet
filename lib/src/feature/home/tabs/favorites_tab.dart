import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/near_by_studios_view.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/settings/view/settings_view.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:go_router/go_router.dart';

import '../../../res/colors.dart';
import '../../../utils/widgets/item_list_tile_view.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  List<String> categories = ["All", "Photography", "Dance", "Art"];
  @override
  Widget build(BuildContext context) {
    int isActive = 0;
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true, floating: true, delegate: SliverHomeHeader()),
        SliverToBoxAdapter(
            child: Container(
          height: 35.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                height: 29,
                margin: EdgeInsets.only(left: index == 0 ? 20 : 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                decoration: BoxDecoration(
                    color: isActive == index
                        ? ColorAssets.primaryBlue
                        : ColorAssets.lightBlueGray,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: isActive == index
                          ? ColorAssets.white
                          : ColorAssets.lightGray),
                ),
              );
            },
          ),
        )),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          sliver: SliverList.builder(
            itemCount: AppData.recomendedStudios.length,
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
        ),
      ],
    );
  }
}

class SliverHomeHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Favorite",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorAssets.blackFaded),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: CircleAvatar(
            // radius: 30,
            backgroundColor: ColorAssets.lightGray.withOpacity(0.1),
            child: Icon(
              Icons.arrow_back,
              color: ColorAssets.black,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: CircleAvatar(
              // radius: 30,
              backgroundColor: ColorAssets.lightGray.withOpacity(0.1),
              child: Icon(
                Icons.search,
                color: ColorAssets.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
