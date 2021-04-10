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

    final map = {
      'name': fields[0] as String,
      'model': fields[1] as String,
      'vehicle_class': fields[2] as String,
      'manufacturer': fields[3] as String,
      'length': fields[4] as String,
      'cost_in_credits': fields[5] as String,
      'crew': fields[6] as String,
      'passengers': fields[7] as String,
      'max_atmosphering_speed': fields[8] as String,
      'cargo_capacity': fields[9] as String,
      'consumables': fields[10] as String,
      'films': (fields[11] as List).cast<String>(),
      'pilots': (fields[12] as List).cast<String>(),
      'url': fields[13] as String,
      'created': fields[14] as String,
      'edited': fields[15] as String,
    };
    return VehiclesItem(map);
  }

  @override
  void write(BinaryWriter writer, VehiclesItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.vehicleClass)
      ..writeByte(3)
      ..write(obj.manufacturer)
      ..writeByte(4)
      ..write(obj.length)
      ..writeByte(5)
      ..write(obj.costInCredits)
      ..writeByte(6)
      ..write(obj.crew)
      ..writeByte(7)
      ..write(obj.passengers)
      ..writeByte(8)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(9)
      ..write(obj.cargoCapacity)
      ..writeByte(10)
      ..write(obj.consumables)
      ..writeByte(11)
      ..write(obj.filmUrls)
      ..writeByte(12)
      ..write(obj.pilotUrls)
      ..writeByte(13)
      ..write(obj.url)
      ..writeByte(14)
      ..write(obj.created)
      ..writeByte(15)
      ..write(obj.edited);
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
