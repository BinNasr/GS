import 'package:beglorious/features/homepage/data/models/specialist_model.dart';

/// Abstract repository interface for salon-related data.
/// Defines the contract that will be implemented by the repository class (`salon_repository_impl.dart`).
abstract class SpecialistRepository {
  /// Fetches a list of salons.
  /// Throws [ServerFailure] if the network request or data fetch fails.
  Future<List<Specialist>> fetchSpecialists();
}
