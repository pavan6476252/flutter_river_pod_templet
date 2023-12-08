import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/animation/glass_morphic_effect.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/custom_list_tile.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/simple_app_bar.dart';
import 'package:flutter_riverpod_base/src/core/config/theme/theme.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/sharing_utils.dart';
import 'package:flutter_riverpod_base/src/utils/studio_app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';
part 'widgets/profile_qr_popup.dart';
part 'widgets/shared_media_viewer_bottom_sheet.dart';
part 'widgets/mute_notifcations_popup.dart';

class UserChatProfileView extends StatefulWidget {
  static String routePath = '/user-chat-profile';

  const UserChatProfileView({Key? key}) : super(key: key);

  @override
  State<UserChatProfileView> createState() => _UserChatProfileViewState();
}

class _UserChatProfileViewState extends State<UserChatProfileView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: SimpleAppBar(
        title: "Profile",
        actions: [
          GestureDetector(
            onTap: () {
              SharingUtils.shareUserProfileINFO(
                  context: context,
                  text: "Pavan kumar",
                  subject: "+91 33543 545 444");
            },
            child: CircleAvatar(
              backgroundColor: colorScheme.secondary,
              child: Icon(Icons.share_rounded),
            ),
          ),
          SizedBox(width: 10),
        ],
      )
      //  PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: StudioAppBar(title: 'Profile', actions: [
      //     IconButton(
      //       onPressed: () {
      //         SharingUtils.shareUserProfileINFO(
      //             context: context,
      //             text: "Pavan kumar",
      //             subject: "+91 33543 545 444");
      //       },
      //       icon: Icon(Icons.share_rounded),
      //     ),
      //     SizedBox(width: 10),
      //   ]),
      // ),
      ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    ImageAssets.profileImageJpeg,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GlassMophicEffect(
                      child: CustomListTile(
                        onTap: () {},
                        title: Text(
                          'Pavan Kumar',
                          style: textTheme.headline6,
                        ),
                        subtitle: Text(
                          '+91 1010 200 004',
                          style: textTheme.subtitle1,
                        ),
                        tailingIcon: IconButton(
                          icon: Icon(
                            Icons.qr_code,
                            color: colorScheme.primary,
                          ),
                          onPressed: () {
                            _showQrCode();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'An artistic haven with vibrant hues, where creativity dances on canvases, fueled by passion, dreams, and boundless imagination',
                  style: textTheme.titleLarge!.copyWith(fontSize: 14),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Media',
                            style: textTheme.bodyLarge!.copyWith(),
                          ),
                          Text(
                            'View All',
                            style: textTheme.bodyLarge!
                                .copyWith(color: colorScheme.primary),
                          ).onTap(() {
                            _viewAllSharedMedia(context);
                          }),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Adjust itemCount accordingly
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 10 : 10,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(ImageAssets.studio1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).addSpacingBetweenElements(10),
              ),
            ),
            Card(
              child: CustomListTile(
                leadingIcon: const Icon(Icons.backup_rounded),
                onTap: () {},
                title: const Text('Backup chat'),
              ),
            ),
            Card(
              child: Column(
                children: [
                  CustomListTile(
                    leadingIcon: Icon(
                      Icons.block_rounded,
                      color: colorScheme.error,
                    ),
                    error: true,
                    title: const Text('Block Pavan Kumar'),
                    onTap: () {},
                  ),
                  CustomListTile(
                    leadingIcon: Icon(
                      Icons.thumb_down,
                      color: colorScheme.error,
                    ),
                    error: true,
                    title: const Text('Report Pavan Kumar'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ).addSpacingBetweenElements(5),
      ),
    );
  }

  void _showQrCode() {
    showAdaptiveDialog(
      context: context,
      builder: (context) => ProfileQRPopup(),
    );
  }

  void _viewAllSharedMedia(BuildContext context) {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) => SharedChatMediaBottomSheet());
  }
}
