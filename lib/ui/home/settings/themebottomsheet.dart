import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.enableLightMode();
            },
            child: provider.themeMode == ThemeMode.light
                ? getSelectedWidget(
                    AppLocalizations.of(context)!.light, context)
                : getUnSelectedWidget(
                    AppLocalizations.of(context)!.light, context),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              provider.enableDarkMode();
            },
            child: provider.themeMode == ThemeMode.dark
                ? getSelectedWidget(AppLocalizations.of(context)!.dark, context)
                : getUnSelectedWidget(
                    AppLocalizations.of(context)!.dark, context),
          )
        ],
      ),
    );
  }

  Widget getSelectedWidget(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }

  Widget getUnSelectedWidget(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
