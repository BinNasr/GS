import 'package:http/http.dart' as http;

import '../utils/config.dart';

class NetworkService {
  // Singleton HTTP Client for reuse
  static final http.Client client = http.Client();

  // Fetch data from any endpoint
  Future<http.Response> get(String endpoint) async {
    final fullUrl = '${AppConfig.baseUrl}$endpoint';
    return await client.get(Uri.parse(fullUrl));
  }
}
