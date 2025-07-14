// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_row_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductRowEntityAdapter extends TypeAdapter<ProductRowEntity> {
  @override
  final int typeId = 2;

  @override
  ProductRowEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductRowEntity(
      name: fields[0] as String,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductRowEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductRowEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
