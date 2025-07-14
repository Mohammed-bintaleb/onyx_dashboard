import 'package:hive/hive.dart';

part 'product_row_entity.g.dart';

@HiveType(typeId: 2)
class ProductRowEntity {
  @HiveField(0)
  String name;
  @HiveField(1)
  int quantity;

  ProductRowEntity({required this.name, required this.quantity});
}
