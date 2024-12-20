class Specialist {
  final String imageUrl;
  final String name;
  final String specialty;
  final double rating;
  final String distance;
  final bool isAd;
  final bool isFeatured;
  final bool isfavorite;
  final bool isFreelancer;

  Specialist(
      {required this.imageUrl,
      required this.name,
      required this.specialty,
      required this.rating,
      required this.distance,
      required this.isAd,
      required this.isFeatured,
      required this.isfavorite,
      required this.isFreelancer});

  factory Specialist.fromJson(Map<String, dynamic> json) {
    return Specialist(
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      specialty: json['specialization'] ?? '',
      rating: json['rating'] ?? 0.0,
      distance: json['distance'] ?? '',
      isAd: json['isAd'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      isfavorite: json['isFavorite'] ?? false,
      isFreelancer: json['isFreelancer'] ?? false,
    );
  }
}
