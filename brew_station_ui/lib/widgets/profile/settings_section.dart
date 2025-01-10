import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/modules/profile/settings_item.dart';
import 'package:brew_station_ui/widgets/profile/settings_card.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

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
        SettingsCard(
          items: [
            SettingsItem(
              icon: Icons.location_on,
              title: 'Dirección de Entrega',
              onTap: () {
                // navegación a pantalla de direcciones
              },
            ),
            SettingsItem(
              icon: Icons.history,
              title: 'Historial de Compras',
              onTap: () {
                //  navegación a historial
              },
            ),
            SettingsItem(
              icon: Icons.credit_card,
              title: 'Métodos de Pago',
              onTap: () {
                //  navegación a métodos de pago
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        SettingsCard(
          items: [
            SettingsItem(
              icon: Icons.exit_to_app,
              title: 'Cerrar sesión',
              onTap: () {
                //  lógica de cierre de sesión
              },
              showDivider: false,
              iconColor: AppColors.dangerColor,
              titleColor:  AppColors.dangerColor,
            ),
          ],
        ),
      ],
    );
  }
}