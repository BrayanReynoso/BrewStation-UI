import 'package:brew_station_ui/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final void Function(int newQuantity) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        item['image'],
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        item['name'],
        style: const TextStyle(
          fontFamily: "Sora",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
      ),
      subtitle: Text(
        "Precio: \$${item['price']}",
        style: const TextStyle(
          fontFamily: "Sora",
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle),
            color: AppColors.warningColor,
            onPressed: () {
              if (item['quantity'] > 1) {
                onQuantityChanged(item['quantity'] - 1);
              }
            },
          ),
          Text(
            "${item['quantity']}",
            style: const TextStyle(
              fontFamily: "Sora",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimaryDark,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle),
            color: AppColors.accentColor,
            onPressed: () {
              onQuantityChanged(item['quantity'] + 1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: AppColors.dangerColor,
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}