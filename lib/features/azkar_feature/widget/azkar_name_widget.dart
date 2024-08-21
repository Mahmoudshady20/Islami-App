import 'package:flutter/material.dart';
import 'package:islamirevision/core/utils/app_styles.dart';

class AzkarNameWidget extends StatelessWidget {
  final String title;
  final int index;
  final void Function()? onTap;
  const AzkarNameWidget({required this.title,required this.index,required this.onTap,super.key,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 28),
          ),
        ),
      ),
    );
  }
}
