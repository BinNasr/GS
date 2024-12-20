import '../../data/models/salon_model.dart';

/// Abstract repository interface for salon-related data.
/// Defines the contract that will be implemented by the repository class (`salon_repository_impl.dart`).
abstract class SalonRepository {
  /// Fetches a list of salons.
  /// Throws [ServerFailure] if the network request or data fetch fails.
  Future<List<Salon>> fetchSalons();
}
