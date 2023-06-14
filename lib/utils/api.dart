import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<dynamic>> fetchCategory() async {
    String url = 'https://fakestoreapi.com/products/categories';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> categories = json.decode(response.body);
      return categories;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  static Future<List<dynamic>> fetchProducts(String? category) async {
    const baseUrl = 'https://fakestoreapi.com';
    final url = category != null
        ? '$baseUrl/products/category/$category'
        : '$baseUrl/products';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> products = json.decode(response.body);
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
