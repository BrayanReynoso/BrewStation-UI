import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/modules/home/home_screen.dart';
import 'package:brew_station_ui/services/favorites_manager.dart';
import 'package:flutter/material.dart';
class CardProduct extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final VoidCallback onPress;
  final VoidCallback onLikePress;

  const CardProduct({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.onPress,
    required this.onLikePress,
  });

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    // Verificar si el producto está en favoritos
    _isLiked = FavoritesManager.isFavorite(Product(
      imageUrl: widget.imageUrl,
      title: widget.title,
      description: widget.description,
      price: widget.price,
      category: '', // Este campo es requerido, pero puedes dejarlo vacío
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  widget.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : AppColors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isLiked) {
                        // Eliminar de favoritos
                        FavoritesManager.removeFromFavorites(Product(
                          imageUrl: widget.imageUrl,
                          title: widget.title,
                          description: widget.description,
                          price: widget.price,
                          category: '', // Este campo es requerido
                        ));
                        print('Se removió el producto ${widget.title} de favoritos');
                      } else {
                        // Agregar a favoritos
                        FavoritesManager.addToFavorites(Product(
                          imageUrl: widget.imageUrl,
                          title: widget.title,
                          description: widget.description,
                          price: widget.price,
                          category: '', // Este campo es requerido
                        ));
                        print('Se agregó el producto ${widget.title} a favoritos');
                      }
                      _isLiked = !_isLiked; // Cambiar el estado visual del corazón
                    });
                    widget.onLikePress(); // Llamar la función proporcionada para manejar el evento en el HomeScreen
                  },
                ),
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.title,
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
                    widget.description,
                    style: const TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.price}',
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
                          onPressed: widget.onPress,
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
                            size: 16,
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
    );
  }
}