import 'package:hive/hive.dart';
import 'package:swapi_dart/swapi_dart.dart';

class SpeciesItemAdapter extends TypeAdapter<SpeciesItem> {
  @override
  final int typeId = 3;

  @override
  SpeciesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpeciesItem(
      url: fields[0] as String,
      name: fields[1] as String,
      classification: fields[2] as String,
      designation: fields[3] as String,
      averageHeight: fields[4] as String,
      averageLifespan: fields[5] as String,
      eyeColors: fields[6] as String,
      hairColors: fields[7] as String,
      skinColors: fields[8] as String,
      language: fields[9] as String,
      homeworldUrl: fields[10] as String?,
      peopleUrls: (fields[11] as List).cast<String>(),
      filmUrls: (fields[12] as List).cast<String>(),
      created: fields[13] as String,
      edited: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpeciesItem obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.classification)
      ..writeByte(3)
      ..write(obj.designation)
      ..writeByte(4)
      ..write(obj.averageHeight)
      ..writeByte(5)
      ..write(obj.averageLifespan)
      ..writeByte(6)
      ..write(obj.eyeColors)
      ..writeByte(7)
      ..write(obj.hairColors)
      ..writeByte(8)
      ..write(obj.skinColors)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.homeworldUrl)
      ..writeByte(11)
      ..write(obj.peopleUrls)
      ..writeByte(12)
      ..write(obj.filmUrls)
      ..writeByte(13)
      ..write(obj.created)
      ..writeByte(14)
      ..write(obj.edited)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeciesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
