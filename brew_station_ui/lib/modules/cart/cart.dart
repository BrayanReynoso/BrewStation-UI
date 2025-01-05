import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CartSceen extends StatefulWidget {
  const CartSceen({super.key});

  @override
  State<CartSceen> createState() => _CartSceenState();
}

class _CartSceenState extends State<CartSceen> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Center(
        child: Text('Cart Screen',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.textSecondary,
            fontFamily: "sora",  fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}