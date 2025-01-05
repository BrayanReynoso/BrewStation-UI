import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String location; // Pasaremos la ubicación como parámetro.

  const LocationWidget({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.primaryAccent,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Ubicación',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryDark,
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                location,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontFamily: 'Sora',
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_drop_down,
                size: 24,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
