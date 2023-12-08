import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:go_router/go_router.dart';

class SliverAppbarwithSearchBar extends StatelessWidget {
  const SliverAppbarwithSearchBar(
      {super.key,
      required this.context,
      required bool isSliverAppBarExpanded,
      required this.controller,
      required this.title,
      this.statusbarColor,
      this.onChange})
      : _isSliverAppBarExpanded = isSliverAppBarExpanded;

  final BuildContext context;
  final Color ?statusbarColor;
  final bool _isSliverAppBarExpanded;
  final String title;
  final TextEditingController controller;
  final Function(String text)? onChange;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SliverAppBar(
     
      forceMaterialTransparency: false,
      backgroundColor: colorScheme.primary,
      snap: true,
      floating: true,
      pinned: true,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: CircleAvatar(
            backgroundColor: colorScheme.secondary,
            // radius: 30,
            // backgroundColor: ColorAssets.lightGray.withOpacity(0.1),
            child: Icon(
              Icons.arrow_back,
              //  color: colorScheme.background
            ),
          ),
        ),
      ),
      title: !_isSliverAppBarExpanded
          ? Text(
              title,
              style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: colorScheme.onPrimary),
            )
          : null,
      bottom: PreferredSize(
        preferredSize: const Size(double.maxFinite, 70),
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 12, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorScheme.secondary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: onChange,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
