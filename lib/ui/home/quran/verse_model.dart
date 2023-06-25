import 'package:hive/hive.dart';

part 'verse_model.g.dart';
@HiveType(typeId: 0)
class VerseModel extends HiveObject{
  @HiveField(0)
  String verse;
  @HiveField(1)
  int suraNumber;
  VerseModel({required this.suraNumber, required this.verse});
}
