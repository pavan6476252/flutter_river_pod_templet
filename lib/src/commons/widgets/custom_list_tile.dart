import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';

class CustomListTile extends StatelessWidget {
  final Widget leadingIcon;
  final Widget title;
  final Widget? tailingIcon;
  final VoidCallback onTap;
  final bool enableBottom;

  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.tailingIcon,
    required this.onTap,
    this.enableBottom = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          leading: leadingIcon,
          title: title,
          trailing: tailingIcon,
        )).onTap(onTap);
  }
}
