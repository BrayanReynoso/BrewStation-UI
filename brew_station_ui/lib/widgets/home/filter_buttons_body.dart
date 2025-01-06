import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final List<String> filters;
  final Function(String) onFilterSelected;
  final String selectedFilter;

  const FilterButtons({
    Key? key,
    required this.filters,
    required this.onFilterSelected,
    required this.selectedFilter, // Recibimos el filtro seleccionado
  }) : super(key: key);

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.filters.map((filter) {
            bool isSelected = widget.selectedFilter == filter; // Verificamos si el filtro está seleccionado

            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ElevatedButton(
                onPressed: () {
                  widget.onFilterSelected(filter); // Llama a la función con el filtro seleccionado
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: isSelected 
                      ? AppColors.white 
                      : AppColors.textSecondary ,
                  backgroundColor: isSelected 
                      ? AppColors.primaryAccent 
                      : Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: isSelected 
                          ? AppColors.primaryAccent 
                          : AppColors.primaryAccent.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? AppColors.white : AppColors.textSecondary,
                    fontFamily: "sora"
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}