// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/search_view/studio_search_view.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/basic_sliver_appbar.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod_base/src/feature/home/near_by_studios_view.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/settings/view/settings_view.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';

import '../../../res/colors.dart';
import '../../../utils/widgets/item_list_tile_view.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  List<String> categories = ["All", "Photography", "Dance", "Art"];
  int sealectedCategoryIndex = 0;
  bool showsSearchBar = false;
  void toggleSearchBar() {
    showsSearchBar = !showsSearchBar;
    searchTerm = '';
    setState(() {});
  }

  String searchTerm = "";
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: kToolbarHeight + 20,
          floating: false,
          pinned: true,
          scrolledUnderElevation: 0,
          surfaceTintColor: ColorAssets.transparent,
          collapsedHeight: kToolbarHeight + 10,
          title: Text(
            "Favorite",
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
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
                backgroundColor: colorScheme.secondary,
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GestureDetector(
                onTap: toggleSearchBar,
                child: CircleAvatar(
                  backgroundColor:colorScheme.secondary,
                  child: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10)
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(showsSearchBar ? 100 : 40),
              child: Column(
                children: [
                  showsSearchBar
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: FormTextField(
                            initialValue: searchTerm,
                            onChanged: changeSearchText,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  searchTerm = '';
                                  setState(() {});
                                },
                                icon: const Icon(Icons.clear)),
                            hintText: "Search..",
                          ),
                        )
                      : const SizedBox.shrink(),
                  Container(
                    height: 30.0,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 29,
                          margin: EdgeInsets.only(left: index == 0 ? 20 : 15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 6),
                          decoration: BoxDecoration(
                              color: sealectedCategoryIndex == index
                                  ? colorScheme.primary
                                  : ColorAssets.lightBlueGray,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: sealectedCategoryIndex == index
                                    ? ColorAssets.white
                                    : ColorAssets.lightGray),
                          ),
                        ).onTap(() {
                          setState(() {
                            sealectedCategoryIndex = index;
                          });
                        });
                      },
                    ),
                  ),
                ],
              )),
        ),
        SliverPadding(
             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), 
          sliver: SliverList.builder(
            itemCount: AppData.recomendedStudios.length,
            itemBuilder: (context, index) {
              final data = AppData.recomendedStudios[index];
              final isCategorySelected = sealectedCategoryIndex == 0;
              final isTagMatch = data.tag.toLowerCase() ==
                  categories[sealectedCategoryIndex].toLowerCase();
              final isTitleMatch =
                  data.title.toLowerCase().contains(searchTerm.toLowerCase());
              final isLocationMatch =
                  data.location.toLowerCase().contains(searchTerm.toLowerCase());
        
              if (isCategorySelected || isTagMatch) {
                if (searchTerm.isEmpty || isTitleMatch || isLocationMatch) {
                  return Container(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 0 : 20,
                    ),
                    child: ItemListTileView(studioModel: data),
                  );
                }
              }
        
              return null;
            },
          ),
        ),
      ],
    );
  }

  void changeSearchText(String text) {
    searchTerm = text;
    setState(() {});
  }
}
