import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class QuantityCounter extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityCounter({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Minus Button
          GestureDetector(
            onTap: onDecrement,
            child: _buildButton(Icons.remove, isPrimary: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          // Plus Button
          GestureDetector(
            onTap: onIncrement,
            child: _buildButton(Icons.add, isPrimary: true),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, {required bool isPrimary}) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primaryBlue : AppColors.productBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 14,
        color: isPrimary ? AppColors.surface : AppColors.textSubtitle,
      ),
    );
  }
}
