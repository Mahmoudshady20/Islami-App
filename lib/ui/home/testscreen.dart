import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/ui/home/quran/verse_model.dart';

class TestScreen extends StatefulWidget {

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    var versebox = Hive.box('verseBox');
    List<VerseModel>? verseList = versebox.values.cast<VerseModel>().toList();
      return Container(
        color: Colors.white,
        child: ListView.builder(
            itemBuilder: (context, index) => Text(verseList[index].verse),
        itemCount: verseList.length,
        ),
      );
  }
}
