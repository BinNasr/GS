class Salon {
  final int id;
  final String name;
  final String status;
  final String timings;
  late String distance; // Remove this and compute dynamically if needed
  final double rating;
  final String imageUrl;
  final List<int> salonType;
  final double latitude;
  final double longitude;
  final bool isAd; // For sponsored cards
  final bool isFeatured; // Highlighted salons

  Salon({
    required this.id,
    required this.name,
    required this.status,
    required this.timings,
    required this.distance,
    required this.rating,
    required this.imageUrl,
    required this.salonType,
    required this.latitude,
    required this.longitude,
    this.isAd = false,
    this.isFeatured = false,
  });

  factory Salon.fromJson(Map<String, dynamic> json) {
    return Salon(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      status: json['status'] ?? 'Closed',
      timings: json['timings'] ?? '',
      distance: json['distance'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      salonType: List<int>.from(json['salonType'] ?? []),
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      isAd: json['isAd'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
    );
  }
}
