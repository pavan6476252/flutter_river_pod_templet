import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/views/help-center/help_center_view.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/settings/view/settings_view.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/colors.dart';
import '../widgets/app_bar.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true, floating: true, delegate: SliverHomeHeader()),
        SliverList(
            delegate: SliverChildListDelegate([
          // profile
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            width: double.maxFinite,
            child: Row(
              children: [
                const Column(
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(ImageAssets.profileImageJpeg)),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 10),
                    Text(
                      "Tara Choudary",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.blackFaded),
                    ),
                    Text(
                      "tarachoudhary@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorAssets.lightGray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: GestureDetector(
              onTap: () {
              // edit option 
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.edit,
                    size: 15,
                    color: ColorAssets.primaryBlue,
                  ),
                  const SizedBox(width: 3.51),
                  Text(
                    "EDIT",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.primaryBlue),
                  )
                ],
              ),
            ),
          ),

          // options
          _optionBuilder(
              context: context,
              leadingIcon: SvgPicture.asset(ImageAssets.user1),
              title: const Text(
                "Your Profile",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                  context.push(EditProfileInfoView.routePath);
              }),
          _optionBuilder(
              context: context,
              leadingIcon: SvgPicture.asset(ImageAssets.settings),
              title: const Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(SettingsView.routePath);
              }),
          _optionBuilder(
              context: context,
              leadingIcon: SvgPicture.asset(ImageAssets.settings),
              title: const Text(
                "App Launguage",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {}),
          _optionBuilder(
              context: context,
              leadingIcon: SvgPicture.asset(ImageAssets.lock),
              title: const Text(
                "Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {}),
          _optionBuilder(
              context: context,
              leadingIcon: SvgPicture.asset(ImageAssets.helpcircle),
              title: const Text(
                "Help Center",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(HelpCenterView.routePath);
              }),
          _optionBuilder(
              context: context,
              leadingIcon: Icon(
                Icons.logout,
                color: ColorAssets.redAccent,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: ColorAssets.redAccent),
              ),
              onTap: () {},
              enableBottom: false),
        ]))
      ],
    );
  }

  _optionBuilder({
    required VoidCallback onTap,
    required BuildContext context,
    required Widget leadingIcon,
    required Widget title,
    Widget? tailingIcon,
    bool enableBottom = true,
  }) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: enableBottom
                ? Border(
                    bottom: BorderSide(
                        color: ColorAssets.lightGray.withOpacity(0.3),
                        width: 0.5))
                : null),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          leading: leadingIcon,
          title: title,
          trailing: tailingIcon,
        ));
  }
}

class SliverHomeHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Profile",
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
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
