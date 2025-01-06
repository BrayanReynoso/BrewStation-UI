// ignore: file_names
import 'package:flutter/material.dart';
import 'package:brew_station_ui/core/constants/colors.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch; // Callback para manejar la búsqueda

  const SearchBarWidget({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.backgroundSoft,
          hintText: 'Buscar cafe...',
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.primaryAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}