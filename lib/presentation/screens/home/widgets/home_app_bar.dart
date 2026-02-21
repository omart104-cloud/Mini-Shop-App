import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../blocs/blocs.dart';
import '../../cart/cart_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 20,
      title: Image.asset(
        'assets/images/logo.png',
        height: 41,
        width: 86,
        errorBuilder: (context, error, stackTrace) => const Text(
          'Mini Shop',
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return _CartBadge(count: state.totalCount);
          },
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}

class _CartBadge extends StatelessWidget {
  final int count;

  const _CartBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Image.asset(
            'assets/images/cart_ic.png',
            height: 26,
            width: 26,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.darkNavy,
              size: 26,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
        ),
        if (count > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: AppColors.surface,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
