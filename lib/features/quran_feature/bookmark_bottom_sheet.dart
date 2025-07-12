import 'package:flutter/material.dart';
import '../../shared/l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/features/quran_feature/model/verse_model.dart';
import 'package:quran/quran.dart' as quran;

class BookMarkBottomSheet extends StatefulWidget {
  final int verseNumber;
  final int suraNumber;

  const BookMarkBottomSheet(
      {super.key, required this.verseNumber, required this.suraNumber});

  @override
  State<BookMarkBottomSheet> createState() => _BookMarkBottomSheetState();
}

class _BookMarkBottomSheetState extends State<BookMarkBottomSheet> {
  var numberController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.boodmark),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.boodmark,
                ),
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                    ),
              ),
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'please enter number';
                }
                if (int.parse(text) > widget.verseNumber) {
                  return 'Please enter the valid number';
                }
                if (int.parse(text) < 0) {
                  return 'Please enter the valid number';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).dividerColor,
              ),
              onPressed: () {
                addBookMark();
                addVerse(
                  VerseModel(
                    suraNumber: widget.suraNumber,
                    verse: quran.getVerse(
                        widget.suraNumber,
                        int.parse(
                          numberController.text,
                        ),
                        verseEndSymbol: true),
                  ),
                );
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.addbutton,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addBookMark() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }

  addVerse(VerseModel versemodel) async {
    var versebox = Hive.box('verseBox');
    await versebox.add(versemodel);
  }
}
