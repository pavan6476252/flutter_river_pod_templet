import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/custom_tab_builder.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    List<String> tags = ["Backdrops", "Lighting Equipment", "Props"];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 30,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomTagBuilder(tag: tags[index]),
                );
              },
              itemCount: tags.length,
            ),
          ),
          _descriptionBuilder(),
          _agentCardBuilder()
        ],
      ),
    );
  }

  _descriptionBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Discover our state-of-the-art Photography Studio,  a haven for photographers and creatives alike. Equipped with professional lighting, a range of backdrops, and an array of props, our studio offers endless possibilities for capturing the perfect shot. Whether you\'re a seasoned photographer or just starting your creative journey, Read More',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorAssets.lightGray,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  _agentCardBuilder() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
          borderRadius: BorderRadius.circular(6),
          color: ColorAssets.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Listing Agent',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: ColorAssets.blackFaded),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: AssetImage(ImageAssets.profileImageJpeg),
              radius: 20,
            ),
            title: Text(
              'Emily Johnson',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ColorAssets.blackFaded),
            ),
            subtitle: Text(
              'Owner',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ColorAssets.lightGray),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorAssets.white,
                      boxShadow: [
                        BoxShadow(
                            color: ColorAssets.lightGray.withOpacity(0.5),
                            blurRadius: 1)
                      ]),
                  child: Icon(
                    Icons.call,
                    size: 20,
                    color: ColorAssets.primaryBlue,
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorAssets.white,
                      boxShadow: [
                        BoxShadow(
                            color: ColorAssets.lightGray.withOpacity(0.5),
                            blurRadius: 1)
                      ]),
                  child: Icon(
                    Icons.message_rounded,
                    size: 20,
                    color: ColorAssets.primaryBlue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
