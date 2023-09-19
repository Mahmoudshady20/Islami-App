import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamirevision/ui/home/hadeth/hadeth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethContnt extends StatelessWidget {
  static const String routeName = 'hadethcontent';

  const HadethContnt({super.key});
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    copy(){
      final value = ClipboardData(text: args.content);
      Clipboard.setData(value);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      body: Card(
        elevation: 24,
          margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 12),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
      ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    args.title,
                    style:args.index == 30 ? Theme.of(context).textTheme.headline3?.copyWith(
                      fontSize: 18
                    ) : Theme.of(context).textTheme.headline3 ,
                  ),
                  IconButton(onPressed: (){
                    copy();
                  }, icon: Icon(Icons.copy,color: Theme.of(context).dividerColor,)
                  )
                ],
              ),
              Container(
                width: double.infinity,
                color: Theme.of(context).hintColor,
                height: 1,
              ),
              Expanded(child:
              args.content.isEmpty ? const Center(child: CircularProgressIndicator()) :SingleChildScrollView(
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
    );
  }
}
