import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/api_service.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiService apiService;

  ProductCubit({required this.apiService}) : super(ProductInitial());

  Future<void> loadProducts() async {
    emit(ProductLoading());
    try {
      final products = await apiService.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
