import 'package:flutter/material.dart';
import 'package:brew_station_ui/widgets/home/card.dart'; // Asegúrate de tener este widget
import 'package:brew_station_ui/widgets/home/filter_buttons_body.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/widgets/SearchField.dart';
import 'package:brew_station_ui/widgets/home/filter.dart';
import 'package:brew_station_ui/widgets/home/location.dart';
import 'package:brew_station_ui/widgets/home/offers_carousel.dart';

// Clase para el producto
class Product {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  Product({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filterOptions = [
    'Todos',
    'Latte',
    'Americano',
    'Cappuccino',
    'Mocha',
  ];

  String selectedFilter = 'Todos';

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    print('Filtro seleccionado: $filter');
  }

  // Lista de productos que se pasará a los widgets CardProduct
  final List<Product> products = [
    Product(
      imageUrl:
          'https://media.istockphoto.com/id/585092216/photo/fresh-black-turkish-coffee-close-up.jpg?s=612x612&w=0&k=20&c=vsslLF4zPUb0iLSEsQBRW7_TyhKkCXQGWPjtkJOA8i4=',
      title: 'Café Turco',
      description: 'Café turco auténtico y fuerte con un sabor intenso.',
      price: '25',
    ),
    Product(
      imageUrl:
          'https://img.freepik.com/foto-gratis/taza-cafe-corazon-dibujado-espuma_1286-70.jpg',
      title: 'Café con Leche',
      description: 'Café suave con una mezcla perfecta de leche espumosa.',
      price: '30',
    ),
    Product(
      imageUrl:
          'https://media.istockphoto.com/id/489377142/es/foto/blanco-taza-de-caf%C3%A9-con-granos-de-caf%C3%A9-sobre-fondo-oscuro.jpg?s=612x612&w=0&k=20&c=k9Gd_xcL99_7A3SIuwVSLN3MMNjOwXVBE7n4dkQatw0=',
      title: 'Café Negro',
      description:
          'Café negro de alta calidad para los amantes del sabor puro.',
      price: '20',
    ),
    Product(
      imageUrl:
          'https://imgcdn.stablediffusionweb.com/2024/10/6/833ed128-3053-437a-b548-89c481157d15.jpg',
      title: 'Café Mocha',
      description: 'Café con chocolate y leche, una delicia dulce y cremosa.',
      price: '40',
    ),
    Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtDqHvJ2vSkA5fP277IkzAWRpY5LKdrpZrh4-LiNscQUQiksbAd0T-MoVKlVUsXwBJ9Sw&usqp=CAU',
      title: 'Café Frappé',
      description:
          'Café helado batido con hielo y crema, refrescante y delicioso.',
      price: '35',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/images/backround.svg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const LocationWidget(
                  location: 'Cuernava, Morelos',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        onSearch: (query) {
                          print('Searching for: $query');
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Filter(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                OffersCarousel(),
                const SizedBox(height: 20),
                FilterButtons(
                  filters: filterOptions,
                  selectedFilter: selectedFilter,
                  onFilterSelected: onFilterSelected,
                ),
                const SizedBox(height: 5),
                // Usamos Expanded para que el GridView ocupe todo el espacio disponible
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Número de columnas
                      crossAxisSpacing: 2, // Espacio entre columnas
                      mainAxisSpacing: 2, // Espacio entre filas
                      childAspectRatio: 0.75, // Ajusta el tamaño de los productos (opcional)
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.all( 3.0), // Espacio alrededor de cada tarjeta
                        child: CardProduct(
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
