import 'package:hive/hive.dart';

import 'package:swapi_dart/swapi_dart.dart';

class FilmsItemAdapter extends TypeAdapter<FilmsItem> {
  @override
  final int typeId = 0;

  @override
  FilmsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilmsItem(
      url: fields[0] as String,
      title: fields[1] as String,
      episodeId: fields[2] as int,
      openingCrawl: fields[3] as String,
      director: fields[4] as String,
      producer: fields[5] as String,
      releaseDate: fields[6] as String,
      specieUrls: (fields[7] as List).cast<String>(),
      starshipUrls: (fields[8] as List).cast<String>(),
      vehicleUrls: (fields[9] as List).cast<String>(),
      characterUrls: (fields[10] as List).cast<String>(),
      planetUrls: (fields[11] as List).cast<String>(),
      created: fields[12] as String,
      edited: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FilmsItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.episodeId)
      ..writeByte(3)
      ..write(obj.openingCrawl)
      ..writeByte(4)
      ..write(obj.director)
      ..writeByte(5)
      ..write(obj.producer)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.specieUrls)
      ..writeByte(8)
      ..write(obj.starshipUrls)
      ..writeByte(9)
      ..write(obj.vehicleUrls)
      ..writeByte(10)
      ..write(obj.characterUrls)
      ..writeByte(11)
      ..write(obj.planetUrls)
      ..writeByte(12)
      ..write(obj.created)
      ..writeByte(13)
      ..write(obj.edited)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmsItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
