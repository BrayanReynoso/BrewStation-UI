import 'package:flutter/material.dart';
import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/modules/home/home_screen.dart'; // Importa la clase Product y FavoritesManager
import 'package:brew_station_ui/services/favorites_manager.dart';  // Importamos el manager de favoritos
import 'package:brew_station_ui/widgets/home/card.dart'; // Importa el widget para mostrar los productos favoritos

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    // Obtiene la lista de productos favoritos
    List<Product> favoriteProducts = FavoritesManager.getFavorites();

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
        child: favoriteProducts.isEmpty
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
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CardProduct(
                      imageUrl: product.imageUrl,
                      title: product.title,
                      description: product.description,
                      price: product.price,
                      onPress: () {
                        print('Ver más del Producto ${product.title}');
                      },
                      onLikePress: () {
                        print('Me gusta el producto ${product.title}');
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}