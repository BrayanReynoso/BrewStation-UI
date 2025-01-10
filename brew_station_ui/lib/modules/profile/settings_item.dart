import 'package:flutter/material.dart';

class SettingsItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;
  final Color? iconColor;
  final Color? titleColor;

  const SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.showDivider = true,
    this.iconColor,
    this.titleColor,
  });
}
