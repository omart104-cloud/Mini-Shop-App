import 'package:flutter/material.dart';
import '../../../../data/models/product.dart';
import '../../../../core/theme/app_colors.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final Product product;
  final VoidCallback onContinueShopping;
  final VoidCallback onViewCart;

  const AddToCartBottomSheet({
    super.key,
    required this.product,
    required this.onContinueShopping,
    required this.onViewCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildViewCartButton(),
          const SizedBox(height: 12),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textMain,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Added To Cart',
              style: TextStyle(fontSize: 16, color: AppColors.textSubtitle),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.check_circle, color: AppColors.success, size: 20),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildViewCartButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onViewCart,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'View Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        onPressed: onContinueShopping,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
          foregroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Continue Shopping',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
