import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Offer {
  final String text;
  final String image;

  Offer({required this.text, required this.image});
}

class OffersCarousel extends StatelessWidget {
  // Lista de ofertas, cada una con su texto y su imagen correspondiente
  final List<Offer> offers = [
    Offer(text: 'Oferta 1: Descuento del 20% en café', image: 'assets/images/offer.jpg'),
    Offer(text: 'Oferta 2: Compra uno, lleva uno gratis', image: 'assets/images/offer2.jpg'),
    Offer(text: 'Oferta 3: 30% en productos seleccionados', image: 'assets/images/offer3.jpg'),
    Offer(text: 'Oferta 4: Envío gratis en compras mayores a 100', image: 'assets/images/offer4.webp'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 400,
      child: PageView.builder(
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
                  // Badge "Promo"
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
                        fontFamily: "sora"
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