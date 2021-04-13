import 'package:hive/hive.dart';
import 'package:swapi_dart/swapi_dart.dart';

class PlanetsItemAdapter extends TypeAdapter<PlanetsItem> {
  @override
  final int typeId = 2;

  @override
  PlanetsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlanetsItem(
      url: fields[0] as String,
      name: fields[1] as String,
      diameter: fields[2] as String,
      rotationPeriod: fields[3] as String,
      orbitalPeriod: fields[4] as String,
      gravity: fields[5] as String,
      population: fields[6] as String,
      climate: fields[7] as String,
      terrain: fields[8] as String,
      surfaceWater: fields[9] as String,
      created: fields[10] as String,
      edited: fields[11] as String,
      residentUrls: (fields[12] as List).cast<String>(),
      filmUrls: (fields[13] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlanetsItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.diameter)
      ..writeByte(3)
      ..write(obj.rotationPeriod)
      ..writeByte(4)
      ..write(obj.orbitalPeriod)
      ..writeByte(5)
      ..write(obj.gravity)
      ..writeByte(6)
      ..write(obj.population)
      ..writeByte(7)
      ..write(obj.climate)
      ..writeByte(8)
      ..write(obj.terrain)
      ..writeByte(9)
      ..write(obj.surfaceWater)
      ..writeByte(10)
      ..write(obj.created)
      ..writeByte(11)
      ..write(obj.edited)
      ..writeByte(12)
      ..write(obj.residentUrls)
      ..writeByte(13)
      ..write(obj.filmUrls)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetsItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
