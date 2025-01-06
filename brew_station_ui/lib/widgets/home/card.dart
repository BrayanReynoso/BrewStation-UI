import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final VoidCallback onPress;
  final VoidCallback onLikePress; // Añadimos un callback para el corazón

  const CardProduct({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.onPress,
    required this.onLikePress, // Recibimos el callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.white,
        child: Column(
          children: <Widget>[
            // Usamos Stack para colocar el ícono de corazón
            Stack(
              children: [
                // Imagen
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Ícono de corazón en la parte superior derecha
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: AppColors.white,
                    ),
                    onPressed: onLikePress, // Llamamos al callback cuando se presiona
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sora",
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$$price',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.dangerColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: onPress,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}