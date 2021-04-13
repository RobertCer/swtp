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
    return StarshipsItem(
      url: fields[0] as String,
      name: fields[1] as String,
      model: fields[2] as String,
      starshipClass: fields[3] as String,
      manufacturer: fields[4] as String,
      costInCredits: fields[5] as String,
      length: fields[6] as String,
      crew: fields[7] as String,
      passengers: fields[8] as String,
      maxAtmospheringSpeed: fields[9] as String,
      hyperdriveRating: fields[10] as String,
      mglt: fields[11] as String,
      cargoCapacity: fields[12] as String,
      consumables: fields[13] as String,
      filmUrls: (fields[14] as List).cast<String>(),
      pilotUrls: (fields[15] as List).cast<String>(),
      created: fields[16] as String,
      edited: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StarshipsItem obj) {
    writer
      ..writeByte(18)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.starshipClass)
      ..writeByte(4)
      ..write(obj.manufacturer)
      ..writeByte(5)
      ..write(obj.costInCredits)
      ..writeByte(6)
      ..write(obj.length)
      ..writeByte(7)
      ..write(obj.crew)
      ..writeByte(8)
      ..write(obj.passengers)
      ..writeByte(9)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(10)
      ..write(obj.hyperdriveRating)
      ..writeByte(11)
      ..write(obj.mglt)
      ..writeByte(12)
      ..write(obj.cargoCapacity)
      ..writeByte(13)
      ..write(obj.consumables)
      ..writeByte(14)
      ..write(obj.filmUrls)
      ..writeByte(15)
      ..write(obj.pilotUrls)
      ..writeByte(16)
      ..write(obj.created)
      ..writeByte(17)
      ..write(obj.edited)
      ..writeByte(0)
      ..write(obj.url);
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
