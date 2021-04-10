import 'package:hive/hive.dart';
import 'package:swapi_dart/swapi_dart.dart';

class StarshipsItemAdapter extends TypeAdapter<StarshipsItem> {
  @override
  final int typeId = 4;

  @override
  StarshipsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    final map = {
      'name': fields[0] as String,
      'model': fields[1] as String,
      'starship_class': fields[2] as String,
      'manufacturer': fields[3] as String,
      'cost_in_credits': fields[4] as String,
      'length': fields[5] as String,
      'crew': fields[6] as String,
      'passengers': fields[7] as String,
      'max_atmosphering_speed': fields[8] as String,
      'hyperdrive_rating': fields[9] as String,
      'MGLT': fields[10] as String,
      'cargo_capacity': fields[11] as String,
      'consumables': fields[12] as String,
      'films': (fields[13] as List).cast<String>(),
      'pilots': (fields[14] as List).cast<String>(),
      'url': fields[15] as String,
      'created': fields[16] as String,
      'edited': fields[17] as String,
    };
    return StarshipsItem(map);
  }

  @override
  void write(BinaryWriter writer, StarshipsItem obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.starshipClass)
      ..writeByte(3)
      ..write(obj.manufacturer)
      ..writeByte(4)
      ..write(obj.costInCredits)
      ..writeByte(5)
      ..write(obj.length)
      ..writeByte(6)
      ..write(obj.crew)
      ..writeByte(7)
      ..write(obj.passengers)
      ..writeByte(8)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(9)
      ..write(obj.hyperdriveRating)
      ..writeByte(10)
      ..write(obj.mglt)
      ..writeByte(11)
      ..write(obj.cargoCapacity)
      ..writeByte(12)
      ..write(obj.consumables)
      ..writeByte(13)
      ..write(obj.filmUrls)
      ..writeByte(14)
      ..write(obj.pilotUrls)
      ..writeByte(15)
      ..write(obj.url)
      ..writeByte(16)
      ..write(obj.created)
      ..writeByte(17)
      ..write(obj.edited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StarshipsItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
