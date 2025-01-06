import 'package:brew_station_ui/widgets/home/filter_buttons_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa el paquete flutter_svg
import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/widgets/SearchField.dart';
import 'package:brew_station_ui/widgets/home/filter.dart';
import 'package:brew_station_ui/widgets/home/location.dart';
import 'package:brew_station_ui/widgets/home/offers_carousel.dart'; // Asegúrate de importar tu carrusel

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

  // Agregamos un estado para el filtro seleccionado
  String selectedFilter = 'Todos';

  // Función para manejar la selección del filtro
  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter; // Actualizamos el filtro seleccionado
    });
    print('Filtro seleccionado: $filter');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            // Fondo SVG
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
                  selectedFilter: selectedFilter, // Pasamos el filtro seleccionado
                  onFilterSelected: onFilterSelected, // Función para actualizar el filtro
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}