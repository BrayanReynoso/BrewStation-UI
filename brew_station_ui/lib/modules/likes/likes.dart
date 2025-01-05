import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Center(
        child: Text('Likes Screen',
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
