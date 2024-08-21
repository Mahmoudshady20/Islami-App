import 'package:flutter/material.dart';
import 'package:islamirevision/core/utils/app_styles.dart';

class SebhaCount extends StatelessWidget {
  const SebhaCount({
    super.key,
    required this.count,
  });
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      //padding: const EdgeInsets.all(15),
      width: 69,
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          count,
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
