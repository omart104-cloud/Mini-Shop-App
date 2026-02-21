import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product.dart';
import '../../../data/models/cart_item.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../blocs/blocs.dart';
import 'quantity_counter.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCart;

  const ProductCard({super.key, required this.product, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        final prevQty = _getQty(previous);
        final currQty = _getQty(current);
        return prevQty != currQty;
      },
      builder: (context, state) {
        final quantity = _getQty(state);

        return Container(
          width: 164,
          height: 216,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildImage(), _buildDetails(context, quantity)],
          ),
        );
      },
    );
  }

  int _getQty(CartState state) {
    return state.items
        .firstWhere(
          (item) => item.product.id == product.id,
          orElse: () => CartItem(product: product, quantity: 0),
        )
        .quantity;
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        height: 150,
        width: double.infinity,
        color: AppColors.productBackground,
        child: Image.network(
          product.thumbnail,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.image_not_supported_outlined,
            size: 40,
            color: AppColors.textLight,
          ),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context, int quantity) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textMain,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 2),
            _buildRatingRow(),
            const SizedBox(height: 2),
            _buildPriceRow(context, quantity),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: AppColors.starGold, size: 14),
        const SizedBox(width: 2),
        Text(
          product.rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSubtitle,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: Text(
            '(${product.reviewCount} reviews)',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: AppColors.textLight),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(BuildContext context, int quantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textMain,
              ),
              children: [
                const TextSpan(
                  text: 'EGP ',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSubtitle,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(text: formatPrice(product.priceEgp)),
              ],
            ),
          ),
        ),
        quantity == 0
            ? _buildAddButton(context)
            : QuantityCounter(
                quantity: quantity,
                onIncrement: () => context.read<CartCubit>().addItem(product),
                onDecrement: () => context.read<CartCubit>().updateQuantity(
                  product,
                  quantity - 1,
                ),
              ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartCubit>().addItem(product);
        onAddToCart?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Image.asset(
          'assets/images/cart_ic.png',
          height: 20,
          width: 20,
          color: AppColors.primaryBlue,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.shopping_bag_outlined,
            size: 20,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }
}
