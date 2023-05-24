import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/ui/home/hadeth/hadeth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HadethContnt extends StatelessWidget {
  static const String routeName = 'hadethcontent';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              provider.themeMode==ThemeMode.light?
              'assets/images/homebackground.png' : 'assets/images/darkbackground.png',
            ),
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        body: Card(
          elevation: 24,
            margin: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
        ),
            child: Column(
              children: [
                Text(
                  args.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).hintColor,
                  height: 1,
                ),
                Expanded(child:
                args.content.isEmpty ? Center(child: CircularProgressIndicator()) :SingleChildScrollView(
                  child:
                    Text(
                      args.content,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                )),
              ],
            )
        ),
      ),
    );
  }
}
