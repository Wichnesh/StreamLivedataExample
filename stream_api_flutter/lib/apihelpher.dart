import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class Livedata {
  static final _key = 'e984b720a29eb5f8726fca8f6053b381';
  static Stream<ProductDetailList> getdata() =>
      Stream.periodic(Duration(seconds: 1)).asyncMap((event) => getjsondata());
  static Future<ProductDetailList> getjsondata() async {
    final url = Uri.parse('http://api.mediastack.com/v1/news?access_key=$_key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProductDetailList.fromJson(data);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
