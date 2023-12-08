import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod_base/src/commons/views/help-center/help_center_view.dart';
import 'package:flutter_riverpod_base/src/commons/views/privacy-policy/privacy_policicy.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/custom_list_tile.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/settings/view/language_view.dart';
import 'package:flutter_riverpod_base/src/feature/settings/view/settings_view.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/basic_sliver_appbar.dart';
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
        // SliverPersistentHeader(
        //     pinned: true, floating: true, delegate: SliverHomeHeader()),
        SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: BasicSliverAppbar(title: "Settings")),
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
                        backgroundImage:
                            AssetImage(ImageAssets.profileImageJpeg)),
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
          CustomListTile(
              leadingIcon: SvgPicture.asset(ImageAssets.user1),
              title: const Text(
                "Your Profile",
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(EditProfileInfoView.routePath);
              }),
          CustomListTile(
              leadingIcon: SvgPicture.asset(ImageAssets.settings),
              title: const Text(
                "Settings",
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(SettingsView.routePath);
              }),
          CustomListTile(
              leadingIcon: SvgPicture.asset(ImageAssets.settings),
              title: const Text(
                "App Language",
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(LanguageSelectionView.routePath);
              }),
          CustomListTile(
              leadingIcon: SvgPicture.asset(ImageAssets.lock),
              title: const Text(
                "Privacy Policy",
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(PrivacyPolicyView.routePath);
              }),
          CustomListTile(
              leadingIcon: SvgPicture.asset(ImageAssets.helpcircle),
              title: const Text(
                "Help Center",
              ),
              tailingIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorAssets.primaryBlue,
              ),
              onTap: () {
                context.push(HelpCenterView.routePath);
              }),
          CustomListTile(
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
}

// class SliverHomeHeader extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     ColorScheme colorScheme = Theme.of(context).colorScheme;
//     return AppBar(
//       // backgroundColor: Colors.white,
//       title: Text(
//         "Profile",
//         style: textTheme.titleLarge!.copyWith(
//           fontWeight: FontWeight.w600,
//           fontSize: 18,
//         ),
//       ),
//       centerTitle: true,
//       leading: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: GestureDetector(
//           onTap: () {
//             context.pop();
//           },
//           child: CircleAvatar(
//             // radius: 30,
//             backgroundColor: ColorAssets.lightGray.withOpacity(0.1),
//             child: Icon(
//               Icons.arrow_back,
//               color: ColorAssets.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 60;

//   @override
//   double get minExtent => 60;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
