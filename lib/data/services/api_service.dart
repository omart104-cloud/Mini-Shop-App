import 'package:dio/dio.dart';
import '../models/product.dart';

class ApiService {
  final String baseUrl;
  final Dio _dio;

  ApiService({required this.baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('/products');

      if (response.statusCode == 200) {
        final List<dynamic> productsJson = response.data['products'];
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
