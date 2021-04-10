import 'package:hive/hive.dart';

import 'package:swapi_dart/swapi_dart.dart';

class PeopleItemAdapter extends TypeAdapter<PeopleItem> {
  @override
  final int typeId = 2;

  @override
  PeopleItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    final map = {
      'name': fields[0] as String,
      'birth_year': fields[1] as String,
      'eye_color': fields[2] as String,
      'gender': fields[3] as String,
      'hair_color': fields[4] as String,
      'height': fields[5] as String,
      'mass': fields[6] as String,
      'skin_color': fields[7] as String,
      'homeworld': fields[8] as String,
      'url': fields[9] as String,
      'created': fields[10] as String,
      'edited': fields[11] as String,
      'films': (fields[12] as List).cast<String>(),
      'species': (fields[13] as List).cast<String>(),
      'starships': (fields[14] as List).cast<String>(),
      'vehicles': (fields[15] as List).cast<String>(),
    };
    return PeopleItem(map);
  }

  @override
  void write(BinaryWriter writer, PeopleItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthYear)
      ..writeByte(2)
      ..write(obj.eyeColor)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.hairColor)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.mass)
      ..writeByte(7)
      ..write(obj.skinColor)
      ..writeByte(8)
      ..write(obj.homeWorldUrl)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.created)
      ..writeByte(11)
      ..write(obj.edited)
      ..writeByte(12)
      ..write(obj.filmUrls)
      ..writeByte(13)
      ..write(obj.specieUrls)
      ..writeByte(14)
      ..write(obj.starShipUrls)
      ..writeByte(15)
      ..write(obj.vehicleUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
