// // import 'dart:convert';
// // import '../../../../core/network/cache_manager.dart';
// // import '../models/salon_model.dart';
// // import 'package:http/http.dart' as http;
// // import '../../../../core/utils/config.dart';

// // class SalonRemoteDataSource {
// //   final String apiUrl = AppConfig.baseUrl;

// //   Future<List<Salon>> fetchSalons() async {
// //     try {
// //       // Step 1: Retrieve cached data
// //       final cachedData = await CacheManager.getData('salons');

// //       // Step 2: Validate cached data
// //       if (cachedData != null && cachedData.isNotEmpty) {
// //         try {
// //           final List<dynamic> data = json.decode(cachedData);
// //           return data.map((json) => Salon.fromJson(json)).toList();
// //         } catch (e) {
// //           print("Error decoding cached data: $e");
// //           // Clear invalid cached data
// //           await CacheManager.saveData(
// //               'salons', '[]'); // Save valid empty JSON array
// //         }
// //       }

// //       // Step 3: Fetch fresh data from API
// //       final response = await http.get(Uri.parse('$apiUrl/salons'));

// //       if (response.statusCode == 200) {
// //         // Save valid response to cache
// //         await CacheManager.saveData('salons', response.body);

// //         final List<dynamic> data = json.decode(response.body);
// //         return data.map((json) => Salon.fromJson(json)).toList();
// //       } else {
// //         throw Exception(
// //             'Failed to fetch salons. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print("Error fetching salons: $e");
// //       throw Exception('Failed to fetch salons: $e');
// //     }
// //   }
// // }
// //=====================

// // import 'dart:convert';
// // import 'package:beglorious/core/utils/config.dart';
// // import 'package:http/http.dart' as http;
// // import '../models/Salon_model.dart';

// // // Remote Data Source Interface
// // abstract class SalonRemoteDataSource {
// //   Future<List<Salon>> fetchSalons();
// // }

// // // Implementation of Remote Data Source
// // class SalonRemoteDataSourceImpl implements SalonRemoteDataSource {
// //   final String apiUrl;

// //   SalonRemoteDataSourceImpl() : apiUrl = AppConfig.baseUrl;

// //   @override
// //   Future<List<Salon>> fetchSalons() async {
// //     final response = await http.get(Uri.parse('$apiUrl/Salons'));

// //     if (response.statusCode == 200) {
// //       final List<dynamic> data = json.decode(response.body);
// //       return data.map((json) => Salon.fromJson(json)).toList();
// //     } else {
// //       throw Exception('Failed to fetch Salons');
// //     }
// //   }
// // }

// import '../../../../core/network/cache_manager.dart';
// import '../models/Salon_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SalonRemoteDataSource {
//   final String apiUrl;

//   // Constructor with a named parameter
//   SalonRemoteDataSource({required this.apiUrl});

//   Future<List<Salon>> fetchSalons() async {
//     final cachedData = await CacheManager.getData('Salons');

//     if (cachedData != null) {
//       final List<dynamic> data = json.decode(cachedData);
//       return data.map((json) => Salon.fromJson(json)).toList();
//     }

//     final response = await http.get(Uri.parse('$apiUrl/Salons'));
//     if (response.statusCode == 200) {
//       await CacheManager.saveData('Salons', response.body);
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Salon.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch Salons');
//     }
//   }
// }

import '../../../../core/network/cache_manager.dart';
import '../models/salon_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SalonRemoteDataSource {
  final String apiUrl;

  SalonRemoteDataSource({required this.apiUrl});

  Future<List<Salon>> fetchSalons() async {
    try {
      // Step 1: Retrieve cached data
      final cachedData = await CacheManager.getData('Salons');

      if (cachedData != null && cachedData.isNotEmpty) {
        final List<dynamic> data = json.decode(cachedData);
        return data.map((json) => Salon.fromJson(json)).toList();
      }

      // Step 2: Fetch fresh data
      final response = await http.get(Uri.parse('$apiUrl/salons'));

      if (response.statusCode == 200) {
        await CacheManager.saveData('Salons', response.body);
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Salon.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch Salons: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in Remote Data Source: $e'); // Log the actual error

      throw Exception('Failed to fetch Salons: $e');
    }
  }
}
