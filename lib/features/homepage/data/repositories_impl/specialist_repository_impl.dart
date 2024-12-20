// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/specialist_model.dart';

// class SpecialistRepository {
//   final String baseUrl;

//   SpecialistRepository({required this.baseUrl});

//   Future<List<Specialist>> fetchSpecialists() async {
//     final response = await http.get(Uri.parse('$baseUrl/specialists'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((specialist) => Specialist.fromJson(specialist)).toList();
//     } else {
//       throw Exception('Failed to load specialists');
//     }
//   }
// }

import '../../domain/repositories/specialist_repository.dart';
import '../datasources/specialists_remote_data_source.dart';
import '../models/specialist_model.dart';

class SpecialistRepositoryImpl implements SpecialistRepository {
  final SpecialistRemoteDataSource remoteDataSource;

  SpecialistRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Specialist>> fetchSpecialists() async {
    try {
      return await remoteDataSource.fetchSpecialists();
    } catch (e) {
      throw Exception('Failed to retrieve specialists');
    }
  }
}
