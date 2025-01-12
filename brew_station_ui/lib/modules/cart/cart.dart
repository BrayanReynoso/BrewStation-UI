import 'package:flutter/material.dart';
import 'package:brew_station_ui/widgets/cart/cart_item.dart';
import 'package:brew_station_ui/widgets/cart/cart_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      "id": 1,
      "name": "Café Espresso",
      "price": 50.0,
      "quantity": 2,
      "image": "assets/images/coffe.webp",
      "description": "Café negro concentrado",
    },
    {
      "id": 2,
      "name": "Latte Macchiato",
      "price": 70.0,
      "quantity": 1,
      "image": "assets/images/coffe.webp",
      "description": "Café con leche y espuma",
    },
     {
      "id": 3,
      "name": "Cafe Americano",
      "price": 70.0,
      "quantity": 1,
      "image": "assets/images/offer3.jpg",
      "description": "Café con leche y espuma",
    },
  ];

  final double deliveryFee = 20.0;

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      if (newQuantity > 0) {
        cartItems[index]['quantity'] = newQuantity;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Producto eliminado del carrito'),
        action: SnackBarAction(
          label: 'DESHACER',
          onPressed: () {
            // lógica para deshacer
          },
        ),
      ),
    );
  }

  double calculateSubtotal() {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = calculateSubtotal();
    double total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrito de Compras',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          if (cartItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                setState(() {
                  cartItems.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Carrito vaciado')),
                );
              },
            ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tu carrito está vacío',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Navegar a la pantalla de productos
                      Navigator.pop(context);
                    },
                    child: const Text('Ver Productos'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        item: cartItems[index],
                        onQuantityChanged: (newQuantity) => 
                          updateQuantity(index, newQuantity),
                        onRemove: () => removeItem(index),
                      );
                    },
                  ),
                ),
                CartSummaryWidget(
                  subtotal: subtotal,
                  deliveryFee: deliveryFee,
                  total: total,
                  onCheckout: () async {
                    // Simular proceso de pago
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Procesando pago...'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 1));
                    if (mounted) {
                      setState(() {
                        cartItems.clear();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Pago completado con éxito!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
    );
  }
}