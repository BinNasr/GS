// import 'dart:convert';
// import 'package:beglorious/core/utils/config.dart';
// import 'package:http/http.dart' as http;
// import '../models/specialist_model.dart';

// // Remote Data Source Interface
// abstract class SpecialistRemoteDataSource {
//   Future<List<Specialist>> fetchSpecialists();
// }

// // Implementation of Remote Data Source
// class SpecialistRemoteDataSourceImpl implements SpecialistRemoteDataSource {
//   final String apiUrl;

//   SpecialistRemoteDataSourceImpl() : apiUrl = AppConfig.baseUrl;

//   @override
//   Future<List<Specialist>> fetchSpecialists() async {
//     final response = await http.get(Uri.parse('$apiUrl/specialists'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Specialist.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch specialists');
//     }
//   }
// }

import '../../../../core/network/cache_manager.dart';
import '../models/specialist_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpecialistRemoteDataSource {
  final String apiUrl;

  // Constructor with a named parameter
  SpecialistRemoteDataSource({required this.apiUrl});

  Future<List<Specialist>> fetchSpecialists() async {
    final cachedData = await CacheManager.getData('specialists');

    if (cachedData != null) {
      final List<dynamic> data = json.decode(cachedData);
      return data.map((json) => Specialist.fromJson(json)).toList();
    }

    final response = await http.get(Uri.parse('$apiUrl/specialists'));
    if (response.statusCode == 200) {
      await CacheManager.saveData('specialists', response.body);
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Specialist.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch specialists');
    }
  }
}
