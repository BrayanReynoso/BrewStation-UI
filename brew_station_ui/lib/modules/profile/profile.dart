import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Center(
        child: Text('Profile Screen',
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
