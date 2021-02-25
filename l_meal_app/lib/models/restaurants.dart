import 'food.dart';

class Restaurants {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;

  Restaurants({
    this.address,
    this.imageUrl,
    this.menu,
    this.name,
    this.rating,
  });
}
