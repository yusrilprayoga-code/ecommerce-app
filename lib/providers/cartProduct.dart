import 'package:hive/hive.dart';

part 'cartProduct.g.dart';

@HiveType(typeId: 0)
class CartProduct extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String category;

  @HiveField(3)
  String image;

  @HiveField(4)
  double price;

  @HiveField(5)
  int id;

  @HiveField(6)
  int quantity;

  @HiveField(7)
  late String username;

  @HiveField(8)
  late String password;

  @HiveField(9)
  late String confirmPassword;

  CartProduct(
      {required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.id,
      required this.quantity,
      required this.username,
      required this.password,
      required this.confirmPassword});
}
