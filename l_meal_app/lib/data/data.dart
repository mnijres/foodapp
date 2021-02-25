import '../models/food.dart';
import '../models/order.dart';
import '../models/restaurants.dart';
import '../models/user.dart';

//food
final _burrito =
    Food(imageUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);

final _steak =
    Food(imageUrl: 'assets/images/steak.jpg', name: 'Steak', price: 17.99);

final _pasta =
    Food(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 15.44);
final _ramen =
    Food(imageUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 11.99);
final _pancakes =
    Food(imageUrl: 'assets/images/pancakes.jpg', name: 'Pancake', price: 9.99);
final _burger =
    Food(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 23.99);
final _pizza =
    Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 29.99);
final _salmon =
    Food(imageUrl: 'assets/images/salmon.jpg', name: 'Salmon', price: 12.99);

// Restaurants
final _restaurant0 = Restaurants(
  imageUrl: 'assets/images/restaurant0.jpg',
  name: 'Restaurant 0',
  address: '200 Main St, New Baghdad, BGH',
  rating: 4,
  menu: [_burger, _pancakes, _burrito, _ramen, _salmon],
);

final _restaurant1 = Restaurants(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Restaurant 1',
  address: '200 Main St, New Baghdad, BGH',
  rating: 5,
  menu: [_salmon, _steak, _pizza, _burger, _ramen, _pasta],
);

final _restaurant2 = Restaurants(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'Restaurant 2',
  address: '300 Main St, Chicago, CH',
  rating: 3,
  menu: [_burger, _burrito, _pizza, _steak, _pancakes, _pasta],
);

final _restaurant3 = Restaurants(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'Restaurant 3',
  address: '200 Main St, New York, NY',
  rating: 2,
  menu: [_burrito, _steak, _burger, _pizza, _salmon],
);

final _restaurant4 = Restaurants(
  imageUrl: 'assets/images/restaurant4.jpg',
  name: 'Restaurant 4',
  address: '200 Main St, New York, NY',
  rating: 3,
  menu: [_burrito, _ramen, _pancakes, _salmon],
);

// Getter
final List<Restaurants> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

// Users
final currentUser = User(
  name: 'Mar0ne',
  orders: [
    Order(
      date: 'Nov 10, 2020',
      food: _burger,
      resturants: _restaurant0,
      quantity: 2,
    ),
    Order(
      date: 'Nov 10, 2020',
      food: _pancakes,
      resturants: _restaurant0,
      quantity: 1,
    ),
    Order(
      date: 'Jan 20, 2021',
      food: _burrito,
      resturants: _restaurant0,
      quantity: 3,
    ),
    Order(
      date: 'Feb 15, 2021',
      food: _pasta,
      resturants: _restaurant0,
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      date: 'Nov 5 2020',
      food: _pancakes,
      resturants: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'Jan 15 2021',
      food: _pasta,
      resturants: _restaurant4,
      quantity: 2,
    ),
    Order(
      date: 'Nov 5 2020',
      food: _pancakes,
      resturants: _restaurant3,
      quantity: 2,
    ),
    Order(
      date: 'Jan 15 2021',
      food: _pasta,
      resturants: _restaurant4,
      quantity: 2,
    ),
  ],
);
