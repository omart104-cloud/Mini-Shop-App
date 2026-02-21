import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product.dart';
import '../../data/models/cart_item.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addItem(Product product) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }

    emit(CartState(items: items));
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      removeItem(product);
      return;
    }

    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      items[index] = items[index].copyWith(quantity: quantity);
      emit(CartState(items: items));
    }
  }

  void removeItem(Product product) {
    final items = List<CartItem>.from(state.items);
    items.removeWhere((item) => item.product.id == product.id);
    emit(CartState(items: items));
  }
}
