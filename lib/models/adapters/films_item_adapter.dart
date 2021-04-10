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
    final map = {
      'title': fields[0] as String,
      'episode_id': fields[1] as int,
      'opening_crawl': fields[2] as String,
      'director': fields[3] as String,
      'producer': fields[4] as String,
      'release_date': fields[5] as String,
      'species': (fields[6] as List).cast<String>(),
      'starships': (fields[7] as List).cast<String>(),
      'vehicles': (fields[8] as List).cast<String>(),
      'characters': (fields[9] as List).cast<String>(),
      'planets': (fields[10] as List).cast<String>(),
      'url': fields[11] as String,
      'created': fields[12] as String,
      'edited': fields[13] as String,
    };
    return FilmsItem(map);
  }

  @override
  void write(BinaryWriter writer, FilmsItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.episodeId)
      ..writeByte(2)
      ..write(obj.openingCrawl)
      ..writeByte(3)
      ..write(obj.director)
      ..writeByte(4)
      ..write(obj.producer)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.specieUrls)
      ..writeByte(7)
      ..write(obj.starshipUrls)
      ..writeByte(8)
      ..write(obj.vehicleUrls)
      ..writeByte(9)
      ..write(obj.characterUrls)
      ..writeByte(10)
      ..write(obj.planetUrls)
      ..writeByte(11)
      ..write(obj.url)
      ..writeByte(12)
      ..write(obj.created)
      ..writeByte(13)
      ..write(obj.edited);
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
