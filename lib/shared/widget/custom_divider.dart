import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.right,
    this.left,
    this.bottom,
    this.top,
  });
  final double? bottom, top, left, right;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).dividerColor,
      height: 2,
      margin: EdgeInsets.only(
        bottom: bottom ?? 0,
        top: top ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
    );
  }
}
