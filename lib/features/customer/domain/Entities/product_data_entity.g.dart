// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDataEntityAdapter extends TypeAdapter<ProductDataEntity> {
  @override
  final int typeId = 1;

  @override
  ProductDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDataEntity(
      available: fields[0] as int,
      price: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDataEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.available)
      ..writeByte(1)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
