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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF0F0F0)),
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
        color: isPrimary ? AppColors.primaryBlue : const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 14,
        color: isPrimary ? Colors.white : const Color(0xFF666666),
      ),
    );
  }
}
