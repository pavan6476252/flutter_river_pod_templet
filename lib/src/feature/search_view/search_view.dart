import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';

class SearchView extends StatefulWidget {
  static String routePath = '/search-view';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  List<String> searchResults = [
    "Photo Studios",
    "Dance Studios",
    "Harmony Studios",
  ];
  int isActive = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: ColorAssets.white,
            boxShadow: [
              BoxShadow(
                  color: ColorAssets.lightGray.withOpacity(0.5), blurRadius: 2)
            ],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back),
        ),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorAssets.lightBlueGray),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: ColorAssets.lightGray),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorAssets.primaryBlue,
                    ),
                    suffixIcon: Icon(
                      Icons.cancel_outlined,
                      color: ColorAssets.primaryBlue,
                    ),
                    border: InputBorder.none),
              )),
            ],
          ),
        ),
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
                        Text(searchResults[index]),
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
                physics: NeverScrollableScrollPhysics(),
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
