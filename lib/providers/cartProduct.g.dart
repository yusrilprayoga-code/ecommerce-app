// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartProduct.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductAdapter extends TypeAdapter<CartProduct> {
  @override
  final int typeId = 0;

  @override
  CartProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProduct(
      title: fields[0] as String,
      description: fields[1] as String,
      category: fields[2] as String,
      image: fields[3] as String,
      price: fields[4] as double,
      id: fields[5] as int,
      quantity: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartProduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
