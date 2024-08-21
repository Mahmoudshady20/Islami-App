import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/features/home/quran/bookmark_wedgit.dart';
import 'package:islamirevision/features/home/quran/quranscreen/verse_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookMarksDetails extends StatefulWidget {
static const String routeName = 'bookmark-screen';

  const BookMarksDetails({super.key});

  @override
  State<BookMarksDetails> createState() => _BookMarksDetailsState();
}

class _BookMarksDetailsState extends State<BookMarksDetails> {
  @override
  Widget build(BuildContext context) {
    var versebox = Hive.box('verseBox');
    List<VerseModel>? verseList = versebox.values.cast<VerseModel>().toList();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BookMarkWidget(verseModel: verseList[index],voidCallBack: deleteBookmark,index: index,),
              itemCount: verseList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 5,),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).dividerColor,
            ),
            onPressed: (){
              showMessage(
                  context, 'هل تريد حذف كل العلامات المرجعية',
                 posAction: () async{
                   await versebox.clear();
                   setState(() {

                   });
                 },
                postActionName: 'نعم',
                dismissible: false,
                  negActionName: 'إلغاء',
                negAction: (){

                }
              );

            }, child: Text(AppLocalizations.of(context)!.clear),
          )
        ],
      ),
    );
  }
  void showMessage(BuildContext context,
      String message, {
        String? postActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool dismissible = true
      }){
    List<Widget> actions = [];
    if(postActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      },
          child: Text(postActionName)));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      },
          child: Text(negActionName)));
    }

    showDialog(context: context,
        builder: (buildContext){
          return AlertDialog(
              content: Text(message,style: const TextStyle(
                  color: Colors.black
              ),),
              actions: actions
          );
        },
        barrierDismissible: dismissible
    );
  }
  deleteBookmark(int index){
    var versebox = Hive.box('verseBox');
    versebox.deleteAt(index);
    setState(() {

    });
  }
}
