import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/custom_list_tile.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/settings/widgets/delete_account_alert.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../res/colors.dart';

class SettingsView extends StatefulWidget {
  static String routePath = '/settings';

  SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true, floating: true, delegate: SliverHomeHeader()),
          SliverList(
            delegate: SliverChildListDelegate([
              CustomListTile(
                leadingIcon: Icon(
                  Icons.notifications_none_sharp,
                  color: ColorAssets.primaryBlue,
                ),
                title: Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorAssets.blackFaded,
                  ),
                ),
                tailingIcon: Icon(Icons.chevron_right_rounded,
                    color: ColorAssets.primaryBlue),
                onTap: () {},
              ),
              CustomListTile(
                leadingIcon: SvgPicture.asset(
                  ImageAssets.key,
                  colorFilter: ColorFilter.mode(
                      ColorAssets.primaryBlue, BlendMode.srcIn),
                ),
                title: Text(
                  "Password Manager",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorAssets.blackFaded,
                  ),
                ),
                tailingIcon: Icon(Icons.chevron_right_rounded,
                    color: ColorAssets.primaryBlue),
                onTap: () {},
              ),
              CustomListTile(
                leadingIcon: SvgPicture.asset(
                  ImageAssets.trash2,
                  colorFilter: ColorFilter.mode(
                      ColorAssets.primaryBlue, BlendMode.srcIn),
                ),
                title: Text(
                  "Delete Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorAssets.blackFaded,
                  ),
                ),
                onTap: () {
                  _showAccountDeleteAlert(context);
                },
                enableBottom: false,
                tailingIcon: Icon(Icons.chevron_right_rounded,
                    color: ColorAssets.primaryBlue),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _showAccountDeleteAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteAccountAlertModel();
        });
  }
}

class SliverHomeHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Settings",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorAssets.blackFaded),
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
            backgroundColor: ColorAssets.lightGray.withOpacity(0.1),
            child: Icon(
              Icons.arrow_back,
              color: ColorAssets.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
