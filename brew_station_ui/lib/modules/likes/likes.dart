import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/modules/home/home_screen.dart';
import 'package:brew_station_ui/widgets/home/card.dart';
import 'package:flutter/material.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  // Lista de productos
  final List<Product> products = [
    Product(
      imageUrl:
          'https://media.istockphoto.com/id/585092216/photo/fresh-black-turkish-coffee-close-up.jpg?s=612x612&w=0&k=20&c=vsslLF4zPUb0iLSEsQBRW7_TyhKkCXQGWPjtkJOA8i4=',
      title: 'Café Turco',
      description: 'Café turco auténtico y fuerte con un sabor intenso.',
      price: '25',
      category: 'Americano',
    ),
    Product(
      imageUrl:
          'https://img.freepik.com/foto-gratis/taza-cafe-corazon-dibujado-espuma_1286-70.jpg',
      title: 'Café con Leche',
      description: 'Café suave con una mezcla perfecta de leche espumosa.',
      price: '30',
      category: 'Latte',
    ),
    Product(
      imageUrl:
          'https://media.istockphoto.com/id/489377142/es/foto/blanco-taza-de-caf%C3%A9-con-granos-de-caf%C3%A9-sobre-fondo-oscuro.jpg?s=612x612&w=0&k=20&c=k9Gd_xcL99_7A3SIuwVSLN3MMNjOwXVBE7n4dkQatw0=',
      title: 'Café Negro',
      description:
          'Café negro de alta calidad para los amantes del sabor puro.',
      price: '20',
      category: 'Americano',
    ),
    Product(
      imageUrl:
          'https://imgcdn.stablediffusionweb.com/2024/10/6/833ed128-3053-437a-b548-89c481157d15.jpg',
      title: 'Café Mocha',
      description: 'Café con chocolate y leche, una delicia dulce y cremosa.',
      price: '40',
      category: 'Mocha',
    ),
    Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtDqHvJ2vSkA5fP277IkzAWRpY5LKdrpZrh4-LiNscQUQiksbAd0T-MoVKlVUsXwBJ9Sw&usqp=CAU',
      title: 'Café Frappé',
      description:
          'Café helado batido con hielo y crema, refrescante y delicioso.',
      price: '35',
      category: 'Cappuccino',
    ),
    Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtDqHvJ2vSkA5fP277IkzAWRpY5LKdrpZrh4-LiNscQUQiksbAd0T-MoVKlVUsXwBJ9Sw&usqp=CAU',
      title: 'Café Frappé Moca',
      description:
          'Café helado batido con hielo y crema, refrescante y delicioso.',
      price: '35',
      category: 'Cappuccino',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: AppColors.textPrimaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
      ),
      body: SafeArea(
        child: products.isEmpty
            ? const Center(
                child: Text(
                  'No tienes productos favoritos.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 18,
                  ),
                ),
              )
            : GridView.builder(
                shrinkWrap: true, // Asegura que el GridView ocupe solo el espacio necesario
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CardProduct(
                    imageUrl: product.imageUrl,
                    title: product.title,
                    description: product.description,
                    price: product.price,
                    onPress: () {
                      print('Ver más del Producto ${product.title}');
                    },
                    onLikePress: () => {
                      print('Me gusta el producto ${product.title}')
                    },
                  );
                },
              ),
      ),
    );
  }
}