// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteBookEntityAdapter extends TypeAdapter<FavoriteBookEntity> {
  @override
  final int typeId = 1;

  @override
  FavoriteBookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteBookEntity(
      bookId: fields[0] as String,
      image: fields[1] as String,
      title: fields[2] as String?,
      autherName: fields[3] as String,
      price: fields[4] as double,
      rating: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteBookEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.autherName)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteBookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
