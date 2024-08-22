import 'package:hive/hive.dart';
import 'package:islamirevision/features/quran_feature/model/verse_model.dart';

class VerseTypeAdaptor extends TypeAdapter<VerseModel> {
  @override
  VerseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VerseModel(
      suraNumber: fields[1] as int,
      verse: fields[0] as String,
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, VerseModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.verse)
      ..writeByte(1)
      ..write(obj.suraNumber);
  }
}
