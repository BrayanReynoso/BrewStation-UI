import 'package:flutter/material.dart';
import 'package:brew_station_ui/core/constants/colors.dart';

class CartSummaryWidget extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;
  final VoidCallback onCheckout;

  const CartSummaryWidget({
    Key? key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.onCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Línea decorativa superior
            Container(
              width: 50,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _SummaryRow(
              label: 'Subtotal',
              value: '\$${subtotal.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            _SummaryRow(
              label: 'Delivery',
              value: '\$${deliveryFee.toStringAsFixed(2)}',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1),
            ),
            _SummaryRow(
              label: 'Total',
              value: '\$${total.toStringAsFixed(2)}',
              isTotal: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCheckout,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.primaryAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Pagar',
                  style: TextStyle(
                    fontFamily: "Sora",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "Sora",
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.textPrimaryDark : AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: "Sora",
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.primaryAccent : AppColors.textPrimaryDark,
          ),
        ),
      ],
    );
  }
}