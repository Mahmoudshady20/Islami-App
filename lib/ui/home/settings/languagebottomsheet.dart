import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.enableArabic();
            },
            child: provider.myLocal == Locale('ar') ?
            getSelectedWidget(AppLocalizations.of(context)!.arabic, context) : getUnSelectedWidget(AppLocalizations.of(context)!.arabic, context),
          ),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              provider.enableEnglish();
            },
            child: provider.myLocal == Locale('en')  ?
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
              .bodyText2,
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
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}