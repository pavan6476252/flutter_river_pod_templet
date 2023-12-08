import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/simple_app_bar.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';

class SearchResultsView extends StatefulWidget {
  static String routePath = '/search-results-view';
  final String? searchTerm;
  const SearchResultsView({super.key, this.searchTerm});

  @override
  State<SearchResultsView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  SimpleAppBar(
        title: widget.searchTerm ?? 'Search Results',
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ItemListTileView(studioModel: AppData.nearByStudios[index]),
          );
        },
        itemCount: AppData.nearByStudios.length,
      ),
    );
  }
}
