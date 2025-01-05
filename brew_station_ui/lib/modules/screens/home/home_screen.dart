import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/widgets/location.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            LocationWidget(
              location: 'Cuernava, Morelos',
            ),
          ],
        ),
      ),
    );
  }
}