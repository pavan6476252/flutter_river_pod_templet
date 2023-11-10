import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/tabs/home_tab.dart';
import 'package:flutter_riverpod_base/src/feature/home/widgets/app_bar.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 10),
          child: HomeViewAppBar(),
        ),
        backgroundColor: ColorAssets.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: ColorAssets.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, spreadRadius: 0, color: ColorAssets.lightGray)
            ],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          height: 82, // Adjust the height as needed
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(0, "Home", ImageAssets.home),
              buildNavItem(1, "Explore", ImageAssets.explore),
              buildNavItem(2, "Favorite", ImageAssets.favorite),
              buildNavItem(3, "Chat", ImageAssets.chat),
              buildNavItem(4, "Profile", ImageAssets.profile),
            ],
          ),
        ),
        body: SafeArea(
            child: [
          HomeTab(),
        ][0]),
      ),
    );
  }

  changeTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildNavItem(int index, String title, String path) {
    final iconColor = index == _currentIndex
        ? ColorAssets.primaryBlue
        : ColorAssets.lightGray;

    return Expanded(
      flex: 1,
      child: Center(
        child: Container(
          child: GestureDetector(
            onTap: () => changeTab(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  path,
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: index == _currentIndex
                          ? ColorAssets.primaryBlue
                          : ColorAssets.lightGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
