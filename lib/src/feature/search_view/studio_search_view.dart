import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/simple_app_bar.dart';
import 'package:flutter_riverpod_base/src/feature/search_view/search_results_view.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';
import 'package:go_router/go_router.dart';

class StudioSearchView extends StatefulWidget {
  static String routePath = '/studio-search-view';
  const StudioSearchView({super.key});

  @override
  State<StudioSearchView> createState() => _StudioSearchViewState();
}

class _StudioSearchViewState extends State<StudioSearchView> {
  List<String> searchResults = [
    "Photo Studios",
    "Dance Studios",
    "Harmony Studios",
  ];
  int isActive = 0;

  @override
  Widget build(BuildContext context) {
        final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: SimpleAppBar(
        title: '',
        titleWidget: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  color.secondary,
            ),
            child: Expanded(
                child: TextFormField(
              onFieldSubmitted: (value) {
                context
                    .push(SearchResultsView.routePath, extra: {'query': value});
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 3),
                  hintText: "Search...",
                  // hintStyle: TextStyle(color: ColorAssets.lightGray),
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorAssets.primaryBlue,
                  ),
                  suffixIcon: Icon(
                    Icons.cancel_outlined,
                    color: ColorAssets.primaryBlue,
                  ),
                  border: InputBorder.none),
            ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recent Search',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(
                  vertical: 10, horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(searchResults[index]).onTap(() {
                          context.push(SearchResultsView.routePath,
                              extra: {'query': searchResults[index]});
                        }),
                        const Icon(Icons.cancel_outlined)
                      ],
                    ),
                  );
                },
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recent View',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ItemListTileView(
                        studioModel: AppData.nearByStudios[index]),
                  );
                },
                itemCount: AppData.nearByStudios.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
