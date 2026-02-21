import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../blocs/blocs.dart';
import 'widgets/cart_item_tile.dart';
import 'widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildCartContent(context, state);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/back_arrow_ic.png',
          height: 24,
          width: 24,
          color: AppColors.primaryBlue,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: AppColors.primaryBlue,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'My Cart',
        style: TextStyle(
          color: AppColors.darkNavy,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_basket_outlined,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Go Shopping'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, CartState state) {
    return Column(
      children: [
        // Top Panel: Summary
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: CartSummary(
            subtotal: state.subtotal,
            shippingFee: state.shippingFee,
            total: state.total,
          ),
        ),

        // Item Count Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${state.totalCount} items',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSubtitle,
              ),
            ),
          ),
        ),

        // Middle: Items List
        Expanded(
          child: ListView.builder(
            itemCount: state.items.length,
            padding: const EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              final item = state.items[index];
              return CartItemTile(
                item: item,
                onQuantityChanged: (qty) =>
                    context.read<CartCubit>().updateQuantity(item.product, qty),
                onRemove: () =>
                    context.read<CartCubit>().removeItem(item.product),
              );
            },
          ),
        ),

        // Bottom Panel: Checkout Button
        _buildCheckoutButton(),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {}, // Checkout logic
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Checkout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
