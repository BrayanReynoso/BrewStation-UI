import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/widgets/cart/cart_item.dart';
import 'package:brew_station_ui/widgets/cart/cart_summary.dart';
import 'package:flutter/material.dart';

class CartSceen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "id": 1,
      "name": "Café Espresso",
      "price": 50.0,
      "quantity": 2,
      "image": "assets/images/coffe.webp",
    },
    {
      "id": 2,
      "name": "Latte Macchiato",
      "price": 70.0,
      "quantity": 1,
       "image": "assets/images/coffe.webp",
    },
  ];

  final double deliveryFee = 20.0;

  CartSceen({super.key});

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
    double total = subtotal + deliveryFee;

    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: cartItems[index],
                  onQuantityChanged: (newQuantity) {
                    // Lógica para manejar el cambio de cantidad
                    print("Updated item ${cartItems[index]['name']} to $newQuantity");
                  },
                  onRemove: () {
                    // Lógica para eliminar un artículo del carrito
                    print("Removed item ${cartItems[index]['name']}");
                  },
                );
              },
            ),
          ),
          CartSummaryWidget(
            subtotal: subtotal,
            deliveryFee: deliveryFee,
            total: total,
            onCheckout: () {
              // Lógica para proceder al checkout
              print("Proceeding to checkout with total: $total");
            },
          ),
        ],
      ),
    );
  }
}