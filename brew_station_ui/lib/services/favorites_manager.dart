import 'package:brew_station_ui/modules/home/home_screen.dart';
class FavoritesManager {
  static final List<Product> _favorites = [];

  // Obtener lista de favoritos
  static List<Product> getFavorites() {
    return _favorites;
  }

  // Agregar a favoritos
  static void addToFavorites(Product product) {
    // Verificar si ya está en favoritos por un campo único como el 'title' o 'productId'
    if (!_favorites.any((p) => p.title == product.title)) {
      _favorites.add(product);
    } else {
      print("El producto ${product.title} ya está en favoritos.");
    }
  }

  // Eliminar de favoritos
  static void removeFromFavorites(Product product) {
    // Eliminar el producto correctamente
    _favorites.removeWhere((p) => p.title == product.title);
  }

  // Verificar si el producto está en favoritos
  static bool isFavorite(Product product) {
    return _favorites.any((p) => p.title == product.title); // Usamos title o algún campo único
  }
}