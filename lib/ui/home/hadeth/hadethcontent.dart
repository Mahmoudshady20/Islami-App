import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/hadeth/hadeth.dart';

class HadethContnt extends StatelessWidget {
  static const String routeName = 'hadethcontent';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              Theme.of(context).primaryColor == Color(0xFFB7935F) ?
              'assets/images/homebackground.png' : 'assets/images/darkbackground.png',
            ),
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Islami'),
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
                  color: Theme.of(context).accentColor,
                  height: 1,
                ),
                Expanded(child: SingleChildScrollView(
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
