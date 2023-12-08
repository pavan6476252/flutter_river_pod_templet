import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/item_list_tile_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:latlong2/latlong.dart';
import '../widgets/custom_search_bar.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(18.4038, 83.3395),
            initialZoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(ImageAssets.mapPoints),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildSearchbar(),
            const Spacer(),
            _buildNearbyLocations(),
          ],
        ),
      ],
    );
  }

  _buildSearchbar() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 50,
        width: double.maxFinite,
        child: const CustomSearchBar());
  }

  _buildNearbyLocations() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      width: double.maxFinite,
      height: 124,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppData.nearByStudios.length,
        itemBuilder: (context, index) {
          final data = AppData.nearByStudios[index];
          return Container(
            margin: const EdgeInsets.only(left: 20),
            width: 320,
            child: ItemListTileView(studioModel: data),
          );
        },
      ),
    );
  }
}
