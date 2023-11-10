import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                        hintText: "Search",
                        hintStyle: TextStyle(color: ColorAssets.lightGray),
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorAssets.lightGray,
                        ),
                        border: InputBorder.none),
                  )),
                ],
              ),
            )),
            const SizedBox(width: 10),
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: ColorAssets.primaryBlue,
                    borderRadius: BorderRadius.circular(6)),
                child: Icon(
                  Icons.tune,
                  color: ColorAssets.white,
                  size: 20,
                ))
          ],
        ));
  }
}
