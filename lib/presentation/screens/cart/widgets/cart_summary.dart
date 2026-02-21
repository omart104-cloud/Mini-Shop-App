import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double shippingFee;
  final double total;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.shippingFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow('Items Total', 'EGP ${subtotal.toStringAsFixed(0)}'),
          const SizedBox(height: 16),
          _buildRow(
            'Shipping Fee',
            shippingFee == 0 ? 'Free' : 'EGP ${shippingFee.toStringAsFixed(0)}',
            valueColor: shippingFee == 0 ? Colors.green : AppColors.textMain,
          ),
          const SizedBox(height: 16),
          _buildRow('Total', 'EGP ${total.toStringAsFixed(0)}', fontSize: 16),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    bool isBold = false,
    double fontSize = 16,
    Color? valueColor,
  }) {
    final isFree = value == 'Free';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: AppColors.textSubtitle,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: fontSize,
              color: valueColor ?? AppColors.textMain,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
            children: isFree
                ? [TextSpan(text: value)]
                : [
                    TextSpan(
                      text: 'EGP ',
                      style: TextStyle(
                        fontSize: fontSize * 0.75,
                        color: AppColors.textSubtitle,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(text: value.replaceAll('EGP ', '')),
                  ],
          ),
        ),
      ],
    );
  }
}
