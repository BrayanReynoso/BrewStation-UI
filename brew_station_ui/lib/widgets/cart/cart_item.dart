import 'package:flutter/material.dart';
import 'package:brew_station_ui/core/constants/colors.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final void Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item['id'].toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: AppColors.dangerColor,
        child: const Icon(Icons.delete, color: AppColors.white),
      ),
      onDismissed: (_) => onRemove(),
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item['image'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Detalles del producto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontFamily: "Sora",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimaryDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description'] ?? '',
                      style: const TextStyle(
                        fontFamily: "Sora",
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryAccent,
                          ),
                        ),
                        Row(
                          children: [
                            _QuantityButton(
                              icon: Icons.remove,
                              onPressed: () {
                                if (item['quantity'] > 1) {
                                  onQuantityChanged(item['quantity'] - 1);
                                }
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundSecondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '${item['quantity']}',
                                style: const TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimaryDark,
                                ),
                              ),
                            ),
                            _QuantityButton(
                              icon: Icons.add,
                              onPressed: () {
                                onQuantityChanged(item['quantity'] + 1);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.primaryAccent,
        ),
      ),
    );
  }
}