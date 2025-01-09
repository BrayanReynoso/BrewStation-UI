import 'dart:async';
import 'package:flutter/material.dart';
import 'package:brew_station_ui/core/constants/colors.dart';

class Offer {
  final String text;
  final String image;

  Offer({required this.text, required this.image});
}

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({super.key});

  @override
  _OffersCarouselState createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  final List<Offer> offers = [
    Offer(text: 'Oferta 1: Descuento del 20% en café', image: 'assets/images/offer.jpg'),
    Offer(text: 'Oferta 2: Compra uno, lleva uno gratis', image: 'assets/images/offer2.jpg'),
    Offer(text: 'Oferta 3: 30% en productos seleccionados', image: 'assets/images/offer3.jpg'),
    Offer(text: 'Oferta 4: Envío gratis en compras mayores a 100', image: 'assets/images/offer4.webp'),
  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Configurar el temporizador para cambiar de página automáticamente
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < offers.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Volver al inicio si estamos en la última página
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancelar el temporizador al salir del widget
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 400,
      child: PageView.builder(
        controller: _pageController,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(offer.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.dangerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '¡Promocion!',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      offer.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sora",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}