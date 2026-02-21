part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  int get totalCount => items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => items.fold(0, (sum, item) => sum + item.subtotal);

  double get shippingFee => 0.0; // Free as per requirement

  double get total => subtotal + shippingFee;

  @override
  List<Object?> get props => [items];
}
