import 'package:flutter/material.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/settings_feature/data/setting_provider.dart';
import 'package:provider/provider.dart';

class SebhaContent extends StatelessWidget {
  const SebhaContent({
    super.key,
    required this.title,
    required this.onTapIncrement,
    required this.onTapRestart,
  });
  final void Function()? onTapIncrement;
  final void Function()? onTapRestart;
  final String title;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of<SettingProvider>(context);
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: InkWell(
            onTap: onTapIncrement,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
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
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onTapRestart,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Icon(
                  Icons.refresh,
                  color: provider.isDark() ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
