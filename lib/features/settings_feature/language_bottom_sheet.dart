import 'package:flutter/material.dart';
import 'package:islamirevision/features/settings_feature/data/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.enableArabic();
            },
            child: provider.myLocal == const Locale('ar') ?
            getSelectedWidget(AppLocalizations.of(context)!.arabic, context) : getUnSelectedWidget(AppLocalizations.of(context)!.arabic, context),
          ),
          const SizedBox(height: 12,),
          InkWell(
            onTap: (){
              provider.enableEnglish();
            },
            child: provider.myLocal == const Locale('en')  ?
            getSelectedWidget(AppLocalizations.of(context)!.english, context) : getUnSelectedWidget(AppLocalizations.of(context)!.english, context),
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
          style: Theme.of(context)
              .textTheme
              .bodyMedium,
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