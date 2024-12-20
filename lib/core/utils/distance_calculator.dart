import 'package:geolocator/geolocator.dart';

class DistanceCalculator {
  /// Calculates distance in kilometers between two coordinates.
  static double calculateDistance({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng) /
        1000;
  }
}
