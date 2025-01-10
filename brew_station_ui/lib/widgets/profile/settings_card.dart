import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/modules/profile/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondary.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              ListTile(
                leading: Icon(
                  item.icon,
                  color: item.iconColor ?? Theme.of(context).primaryColor,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                    color: item.titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: item.onTap,
              ),
              if (item.showDivider && index != items.length - 1)
                const Divider(height: 1),
            ],
          );
        }).toList(),
      ),
    );
  }
}