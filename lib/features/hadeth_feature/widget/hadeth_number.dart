import 'package:flutter/material.dart';
import 'package:islamirevision/core/utils/app_styles.dart';

class HadethNumber extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const HadethNumber(
    this.title, {
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: AppStyles.getResponsiveFontSize(
                  context,
                  fontSize: 26,
                ),
              ),
        ),
      ),
    );
  }
}
