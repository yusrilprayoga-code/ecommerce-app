import 'dart:convert';

import 'package:ecommerce_app/constants/ecommerce_impl.dart';
import 'package:http/http.dart' as http;

class ApiSource {
  static const ecommerceUrl = 'https://fakestoreapi.com/products';

  Future<List<EcommerceData>> getEcommerceData() async {
    final response = await http.get(Uri.parse(ecommerceUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => EcommerceData.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
