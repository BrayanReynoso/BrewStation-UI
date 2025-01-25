// lib/services/favorites_manager.dart
import 'package:brew_station_ui/modules/home/home_screen.dart';

class FavoritesManager {
  static final List<Product> _favorites = [];

  // Obtener lista de favoritos
  static List<Product> getFavorites() {
    return _favorites;
  }

  // Agregar a favoritos
  static void addToFavorites(Product product) {
    if (!_favorites.contains(product)) {
      _favorites.add(product);
    }
  }

  // Eliminar de favoritos
  static void removeFromFavorites(Product product) {
    _favorites.remove(product);
  }

  // Verificar si el producto está en favoritos
  static bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}