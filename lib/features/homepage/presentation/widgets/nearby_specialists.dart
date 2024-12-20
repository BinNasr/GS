import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/specialist_model.dart';
import '../../domain/repositories/specialist_repository.dart';
import 'specialist_card.dart';

/// A horizontally scrollable widget to display nearby specialists.
class NearbySpecialists extends StatefulWidget {
  final SpecialistRepository repository;

  const NearbySpecialists({super.key, required this.repository});

  @override
  State<NearbySpecialists> createState() => _NearbySpecialistsState();
}

class _NearbySpecialistsState extends State<NearbySpecialists> {
  List<Specialist> specialists = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchSpecialists();
  }

  /// Fetch specialists data from the repository
  Future<void> _fetchSpecialists() async {
    try {
      final fetchedSpecialists = await widget.repository.fetchSpecialists();
      setState(() {
        specialists = fetchedSpecialists;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text("Error: $errorMessage"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialists.length,
            itemBuilder: (context, index) {
              final specialist = specialists[index];
              return SpecialistCard(
                imageUrl: specialist.imageUrl,
                name: specialist.name,
                specialty: specialist.specialty,
                rating: specialist.rating,
                distance: specialist.distance,
                isFeatured: specialist.isFeatured,
                isAd: specialist.isAd,
                isFavorite: specialist.isfavorite,
                isFreelancer: specialist.isFreelancer,
              );
            },
          ),
        ),
      ],
    );
  }
}
