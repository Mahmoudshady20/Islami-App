import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/features/quran_feature/bookmark_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/features/quran_feature/model/verse_model.dart';

class BookMarksDetails extends StatefulWidget {
  static const String routeName = 'bookmark-screen';

  const BookMarksDetails({super.key});

  @override
  State<BookMarksDetails> createState() => _BookMarksDetailsState();
}

class _BookMarksDetailsState extends State<BookMarksDetails> {
  @override
  Widget build(BuildContext context) {
    var verseBox = Hive.box('verseBox');
    List<VerseModel>? verseList = verseBox.values.cast<VerseModel>().toList();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BookMarkWidget(
                verseModel: verseList[index],
                voidCallBack: deleteBookmark,
                index: index,
              ),
              itemCount: verseList.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).dividerColor,
            ),
            onPressed: () {
              showMessage(
                context,
                'هل تريد حذف كل العلامات المرجعية',
                posAction: () async {
                  await verseBox.clear();
                  setState(() {});
                },
                postActionName: 'نعم',
                dismissible: false,
                negActionName: 'إلغاء',
                negAction: () {},
              );
            },
            child: Text(
              AppLocalizations.of(context)!.clear,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(BuildContext context, String message,
      {String? postActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool dismissible = true}) {
    List<Widget> actions = [];
    if (postActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(postActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }

    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
              content: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: actions);
        },
        barrierDismissible: dismissible);
  }

  deleteBookmark(int index) {
    var verseBox = Hive.box(
      'verseBox',
    );
    verseBox.deleteAt(
      index,
    );
    setState(() {});
  }
}
