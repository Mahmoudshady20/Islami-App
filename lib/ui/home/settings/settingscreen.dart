import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/ui/home/settings/languagebottomsheet.dart';
import 'package:islamirevision/ui/home/settings/themebottomsheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Theme.of(context).hintColor,
                  width: 1,
                )
              ),
              child: Text( provider.themeMode==ThemeMode.light?AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: (){
              showlanBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Theme.of(context).hintColor,
                    width: 1,
                  )
              ),
              child: Text(
                provider.myLocal==Locale('ar')?AppLocalizations.of(context)!.arabic : AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showThemeBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => ThemeBottomSheet(),);
  }
  void showlanBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),);
  }
}
