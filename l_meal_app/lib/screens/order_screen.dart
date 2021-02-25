import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:l_meal_app/models/order.dart';
import '../data/data.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      height: 170.0,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Row(children: [
              Stack(children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black87.withOpacity(0.2),
                        Colors.black54.withOpacity(0.3),
                        Colors.black38.withOpacity(0.2),
                      ],
                      stops: [
                        0.1,
                        0.3,
                        0.5,
                        0.6,
                      ],
                    ),
                  ),
                ),
              ]),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.food.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      order.resturants.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black45,
                            width: 0.8,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 25),
                          Text(
                            order.quantity.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 25),
                          Text(
                            '+',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          Container(
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    currentUser.cart.forEach(
      (Order order) => totalAmount += order.quantity * order.food.price,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.orders.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated delivery Time: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amoun: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                )
              ],
            ),
          );
        },
        itemCount: currentUser.orders.length + 1,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0.8,
            color: Colors.black54,
          );
        },
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -1),
            blurRadius: 6.0,
          )
        ]),
        child: Center(
          child: FlatButton(
            child: Text(
              'CHECKOUT',
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                      // titlePadding: EdgeInsets.all(10),
                      title: Center(
                        child: Center(
                          child: Text(
                            'Thank you',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      content: Text(
                        'Thank you for choosing our products\nFor more information PLEASE contact us on:\nm.nejres@gmail.com',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )));
            },
          ),
        ),
      ),
    );
  }
}
