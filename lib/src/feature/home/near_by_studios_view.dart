import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart'; 
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';
import 'package:go_router/go_router.dart';

import '../../res/data.dart';
 

class NearbyStudiosView extends StatefulWidget {
  static String routePath = '/near-by-studios';
  final List<StudioModel> studios;

  const NearbyStudiosView({super.key, required this.studios});

  @override
  State<NearbyStudiosView> createState() => _NearbyStudiosViewState();
}

class _NearbyStudiosViewState extends State<NearbyStudiosView> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Nearby Studio",
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
      body:  Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: widget.studios.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = widget.studios[index];
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
