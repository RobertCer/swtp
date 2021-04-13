import 'package:hive/hive.dart';

import 'package:swapi_dart/swapi_dart.dart';

class PeopleItemAdapter extends TypeAdapter<PeopleItem> {
  @override
  final int typeId = 1;

  @override
  PeopleItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeopleItem(
      url: fields[0] as String,
      name: fields[1] as String,
      birthYear: fields[2] as String,
      eyeColor: fields[3] as String,
      gender: fields[4] as String,
      hairColor: fields[5] as String,
      height: fields[6] as String,
      mass: fields[7] as String,
      skinColor: fields[8] as String,
      homeWorldUrl: fields[9] as String,
      created: fields[10] as String,
      edited: fields[11] as String,
      filmUrls: (fields[12] as List).cast<String>(),
      specieUrls: (fields[13] as List).cast<String>(),
      starShipUrls: (fields[14] as List).cast<String>(),
      vehicleUrls: (fields[15] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PeopleItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.birthYear)
      ..writeByte(3)
      ..write(obj.eyeColor)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.hairColor)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.mass)
      ..writeByte(8)
      ..write(obj.skinColor)
      ..writeByte(9)
      ..write(obj.homeWorldUrl)
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
      ..write(obj.vehicleUrls)
      ..writeByte(0)
      ..write(obj.url);
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
