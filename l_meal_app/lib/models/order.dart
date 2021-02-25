import './food.dart';
import 'restaurants.dart';

class Order {
  final Restaurants resturants;
  final Food food;
  final String date;
  final int quantity;

  Order({
    this.date,
    this.food,
    this.quantity,
    this.resturants,
  });
}
