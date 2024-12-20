// import '../../domain/repositories/salon_repository.dart';
// import '../datasources/salon_remote_data_source.dart';
// import '../models/salon_model.dart';

// class SalonRepositoryImpl implements SalonRepository {
//   final SalonRemoteDataSource remoteDataSource;

//   SalonRepositoryImpl(this.remoteDataSource);

//   @override
//   Future<List<Salon>> fetchSalons() async {
//     try {
//       return await remoteDataSource.fetchSalons();
//     } catch (e) {
//       throw Exception('Failed to retrieve salons');
//     }
//   }
// }

// }

import '../../domain/repositories/salon_repository.dart';
import '../datasources/salon_remote_data_source.dart';
import '../models/salon_model.dart';

class SalonRepositoryImpl implements SalonRepository {
  final SalonRemoteDataSource remoteDataSource;

  SalonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Salon>> fetchSalons() async {
    try {
      return await remoteDataSource.fetchSalons();
    } catch (e) {
      print('Error in Repository: $e'); // Log the actual error message
      throw Exception('Failed to retrieve salons: $e');
    }
  }
}
