import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        color: AppColors.primaryAccent,
        icon: const Icon(
          Icons.tune,
          color: AppColors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: AppColors.backgroundSoft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: const Text(
                  'Filtrar por:',
                  style: TextStyle(
                    color: AppColors.textPrimaryDark,
                    fontWeight: FontWeight.bold,
                      fontFamily: "sora"
                  ),
                ),
                content: const Text(
                  'Filtros disponibles aquí.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                      fontFamily: "sora"
                  ),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          side: const BorderSide(color: AppColors.textSecondary), 
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.cancel, color: AppColors.textSecondary),
                            SizedBox(width: 6),
                            Text(
                              'Cancelar',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                                  fontFamily: "sora"
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          // Acción de aplicar
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.check, color: AppColors.white),
                            SizedBox(width: 6),
                            Text(
                              'Aplicar',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sora"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}