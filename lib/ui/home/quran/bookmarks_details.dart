import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/ui/home/quran/bookmark_wedgit.dart';
import 'package:islamirevision/ui/home/quran/verse_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookMarksDetails extends StatefulWidget {
static const String routeName = 'bookmark-screen';

  @override
  State<BookMarksDetails> createState() => _BookMarksDetailsState();
}

class _BookMarksDetailsState extends State<BookMarksDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var versebox = Hive.box('verseBox');
    List<VerseModel>? verseList = versebox.values.cast<VerseModel>().toList();
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage( provider.themeMode==ThemeMode.light?
              'assets/images/homebackground.png' : 'assets/images/darkbackground.png',
              ),
            )
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => BookMarkWidget(versemodel: verseList[index],voidCallBack: deleteBookmark,index: index,),
                itemCount: verseList.length,
                separatorBuilder: (context, index) => SizedBox(height: 5,),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).dividerColor,
              ),
              onPressed: (){
                versebox.clear();
                setState(() {

                });
              }, child: Text(AppLocalizations.of(context)!.clear),
            )
          ],
        ),
        //verseList[index].verse
      ),
    );
  }
  deleteBookmark(int index){
    var versebox = Hive.box('verseBox');
    versebox.deleteAt(index);
    setState(() {

    });
  }
}
