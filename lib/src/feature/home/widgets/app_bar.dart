import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(
          ImageAssets.apple,
        ),
      ),
      title: Text(
        'Tara Choudhary',
        style: TextStyle(
            fontSize: 18,
            color: ColorAssets.blackFaded,
            fontWeight: FontWeight.w600),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pune',
            style: TextStyle(
                fontSize: 14,
                color: ColorAssets.blackFaded,
                fontWeight: FontWeight.w400),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: ColorAssets.blackFaded,
          )
        ],
      ),
      trailing: CircleAvatar(
        backgroundColor: ColorAssets.lightGray.withOpacity(0.1),
        child: Badge(
          child: Icon(
            Icons.notifications,
            color: ColorAssets.black,
          ),
        ),
      ),
    );
  }
}
