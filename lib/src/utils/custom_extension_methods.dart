import 'package:flutter/material.dart';

extension ColumnWithSpacing on Column {
  Column addSpacingBetweenElements(double height) {
    List<Widget> spacedChildren = [];
    for (var child in children) {
      spacedChildren.add(child);
      spacedChildren.add(SizedBox(height: height));
    }
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: spacedChildren,
    );
  }
}

extension PoweredText on Text {
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

extension CustomContainer on Container {
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}
