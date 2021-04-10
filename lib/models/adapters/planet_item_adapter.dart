import 'package:hive/hive.dart';
import 'package:swapi_dart/swapi_dart.dart';

class PlanetsItemAdapter extends TypeAdapter<PlanetsItem> {
  @override
  final int typeId = 1;

  @override
  PlanetsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final map = {
      'name': fields[0] as String,
      'diameter': fields[1] as String,
      'rotation_period': fields[2] as String,
      'orbital_period': fields[3] as String,
      'gravity': fields[4] as String,
      'population': fields[5] as String,
      'climate': fields[6] as String,
      'terrain': fields[7] as String,
      'surface_water': fields[8] as String,
      'url': fields[9] as String,
      'created': fields[10] as String,
      'edited': fields[11] as String,
      'residents': (fields[12] as List).cast<String>(),
      'films': (fields[13] as List).cast<String>(),
    };
    return PlanetsItem(map);
  }

  @override
  void write(BinaryWriter writer, PlanetsItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.diameter)
      ..writeByte(2)
      ..write(obj.rotationPeriod)
      ..writeByte(3)
      ..write(obj.orbitalPeriod)
      ..writeByte(4)
      ..write(obj.gravity)
      ..writeByte(5)
      ..write(obj.population)
      ..writeByte(6)
      ..write(obj.climate)
      ..writeByte(7)
      ..write(obj.terrain)
      ..writeByte(8)
      ..write(obj.surfaceWater)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.created)
      ..writeByte(11)
      ..write(obj.edited)
      ..writeByte(12)
      ..write(obj.residentUrls)
      ..writeByte(13)
      ..write(obj.filmUrls);
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
