// modules/profile/profile.dart
import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:brew_station_ui/widgets/profile/profile_header.dart';
import 'package:brew_station_ui/widgets/profile/settings_section.dart';
import 'package:brew_station_ui/modules/profile/settings_item.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  List<List<SettingsItem>> get _settingsGroups => [
    // Primer grupo de configuraciones
    [
      SettingsItem(
      iconColor: AppColors.accentColor,
        icon: Icons.location_on,
        title: 'Dirección de Entrega',
        onTap: () {
          // Implementar navegación a pantalla de direcciones
        },
      ),
      SettingsItem(
        icon: Icons.history,
        title: 'Historial de Compras',
        onTap: () {
          // Implementar navegación a historial
        },
      ),
      SettingsItem(
        iconColor: AppColors.textSecondary,
        icon: Icons.credit_card,
        title: 'Métodos de Pago',
        onTap: () {
          // Implementar navegación a métodos de pago
        },
      ),
    ],
    // Segundo grupo de configuraciones (por ejemplo, para cerrar sesión)
    [
      SettingsItem(
        icon: Icons.exit_to_app,
        title: 'Cerrar sesión',
        onTap: () {
          // Implementar lógica de cierre de sesión
        },
        showDivider: false,
        iconColor: Colors.red,
        titleColor: Colors.red,
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: AppColors.primaryAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const SizedBox(height: 32),
              SettingsSection(settingsGroups: _settingsGroups),
            ],
          ),
        ),
      ),
    );
  }
}