import 'package:hive/hive.dart';

part 'product_data_entity.g.dart';

@HiveType(typeId: 1)
class ProductDataEntity {
  @HiveField(0)
  final int available;

  @HiveField(1)
  final double price;

  ProductDataEntity({required this.available, required this.price});
}
