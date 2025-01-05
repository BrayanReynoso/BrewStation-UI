import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Center(
          child: Text(
          "¡Bienvenido a Brew Station!",
          style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.bold, fontSize: 24),
        ),
        ),
      ),
    );
  }
}
