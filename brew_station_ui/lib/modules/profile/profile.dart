import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/widgets/profile/profile_header.dart';
import 'package:brew_station_ui/widgets/profile/settings_section.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: AppColors.primaryAccent,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              SizedBox(height: 32),
              SettingsSection(),
            ],
          ),
        ),
      ),
    );
  }
}