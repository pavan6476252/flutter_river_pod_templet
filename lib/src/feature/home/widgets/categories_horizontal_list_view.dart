import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';

class CategoriesHorizontalListView extends StatefulWidget {
  const CategoriesHorizontalListView({super.key});

  @override
  State<CategoriesHorizontalListView> createState() =>
      _CategoriesHorizontalListViewState();
}

class _CategoriesHorizontalListViewState
    extends State<CategoriesHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 85,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 24 : 30),
            child: Column(
              children: [
                Image.asset(
                  AppData.categories[index].image,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
                // const SizedBox(height: 10),
                Spacer(),
                Text(
                  AppData.categories[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: AppData.categories.length,
      ),
    );
  }
}
