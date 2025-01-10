// widgets/profile/settings_section.dart
import 'package:flutter/material.dart';
import 'package:brew_station_ui/modules/profile/settings_item.dart';
import 'package:brew_station_ui/widgets/profile/settings_card.dart';

class SettingsSection extends StatelessWidget {
  final List<List<SettingsItem>> settingsGroups;
  
  const SettingsSection({
    super.key,
    required this.settingsGroups,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Configuraciones',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...settingsGroups.map((group) {
          return Column(
            children: [
              SettingsCard(items: group),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ],
    );
  }
}