import 'package:brew_station_ui/core/constants/colors.dart';
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
      body: Center(
        child: Text('Home Screen',
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