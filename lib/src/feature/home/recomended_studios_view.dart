import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';
import 'package:go_router/go_router.dart';

class RecommendedStudiosView extends StatefulWidget {
  static String routePath = '/recomended-by-studios';

  final List<StudioModel> studios;
  const RecommendedStudiosView({super.key, required this.studios});

  @override
  State<RecommendedStudiosView> createState() => _RecommendedStudiosViewState();
}

class _RecommendedStudiosViewState extends State<RecommendedStudiosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recomended Studio",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorAssets.blackFaded),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
             onTap: (){
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
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: widget.studios.length,
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
      ),
    );
  }
}
