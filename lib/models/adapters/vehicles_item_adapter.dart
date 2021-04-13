import 'package:hive/hive.dart';
import 'package:swapi_dart/swapi_dart.dart';

class VehiclesItemAdapter extends TypeAdapter<VehiclesItem> {
  @override
  final int typeId = 5;

  @override
  VehiclesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehiclesItem(
      url: fields[0] as String,
      name: fields[1] as String,
      model: fields[2] as String,
      vehicleClass: fields[3] as String,
      manufacturer: fields[4] as String,
      length: fields[5] as String,
      costInCredits: fields[6] as String,
      crew: fields[7] as String,
      passengers: fields[8] as String,
      maxAtmospheringSpeed: fields[9] as String,
      cargoCapacity: fields[10] as String,
      consumables: fields[11] as String,
      filmUrls: (fields[12] as List).cast<String>(),
      pilotUrls: (fields[13] as List).cast<String>(),
      created: fields[14] as String,
      edited: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VehiclesItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.vehicleClass)
      ..writeByte(4)
      ..write(obj.manufacturer)
      ..writeByte(5)
      ..write(obj.length)
      ..writeByte(6)
      ..write(obj.costInCredits)
      ..writeByte(7)
      ..write(obj.crew)
      ..writeByte(8)
      ..write(obj.passengers)
      ..writeByte(9)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(10)
      ..write(obj.cargoCapacity)
      ..writeByte(11)
      ..write(obj.consumables)
      ..writeByte(12)
      ..write(obj.filmUrls)
      ..writeByte(13)
      ..write(obj.pilotUrls)
      ..writeByte(14)
      ..write(obj.created)
      ..writeByte(15)
      ..write(obj.edited)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiclesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
