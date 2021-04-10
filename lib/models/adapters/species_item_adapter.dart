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

    final map = {
      'name': fields[0] as String,
      'classification': fields[1] as String,
      'designation': fields[2] as String,
      'average_height': fields[3] as String,
      'average_lifespan': fields[4] as String,
      'eye_colors': fields[5] as String,
      'hair_colors': fields[6] as String,
      'skin_colors': fields[7] as String,
      'language': fields[8] as String,
      'homeworld': fields[9] as String?,
      'people': (fields[10] as List).cast<String>(),
      'films': (fields[11] as List).cast<String>(),
      'url': fields[12] as String,
      'created': fields[13] as String,
      'edited': fields[14] as String,
    };

    return SpeciesItem(map);
  }

  @override
  void write(BinaryWriter writer, SpeciesItem obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.classification)
      ..writeByte(2)
      ..write(obj.designation)
      ..writeByte(3)
      ..write(obj.averageHeight)
      ..writeByte(4)
      ..write(obj.averageLifespan)
      ..writeByte(5)
      ..write(obj.eyeColors)
      ..writeByte(6)
      ..write(obj.hairColors)
      ..writeByte(7)
      ..write(obj.skinColors)
      ..writeByte(8)
      ..write(obj.language)
      ..writeByte(9)
      ..write(obj.homeworldUrl)
      ..writeByte(10)
      ..write(obj.peopleUrls)
      ..writeByte(11)
      ..write(obj.filmUrls)
      ..writeByte(12)
      ..write(obj.url)
      ..writeByte(13)
      ..write(obj.created)
      ..writeByte(14)
      ..write(obj.edited);
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
