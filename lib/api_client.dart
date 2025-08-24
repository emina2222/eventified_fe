
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const _base = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://localhost:8080');

  static Future<Map<String, dynamic>> fetchData(String path) async {
    final res = await http.get(Uri.parse('$_base$path'));
    if(res.statusCode >= 200 && res.statusCode < 300) {
      return json.decode(res.body) as Map<String, dynamic>;
    } else {
      throw Exception('GET $path failed: ${res.statusCode}');
    }
  }
}