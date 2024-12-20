import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/salon_model.dart';
// import '../../data/repositories_impl/salon_repository_impl.dart';
import '../../domain/repositories/salon_repository.dart';
import 'salon_card.dart';

/// A horizontally scrollable widget to display nearby salons.
class NearbySalons extends StatefulWidget {
  final SalonRepository repository;

  const NearbySalons({super.key, required this.repository});

  @override
  State<NearbySalons> createState() => _NearbySalonsState();
}

class _NearbySalonsState extends State<NearbySalons> {
  List<Salon> salons = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchSalons();
  }

  /// Fetch salons data from the repository
  Future<void> _fetchSalons() async {
    try {
      final fetchedSalons = await widget.repository.fetchSalons();
      setState(() {
        salons = fetchedSalons;
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

    return SizedBox(
      height: 273.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: salons.length,
        itemBuilder: (context, index) {
          final salon = salons[index];
          return SizedBox(
            width: 200.w,
            child: SalonCard(
              imageUrl: salon.imageUrl,
              name: salon.name,
              status: salon.status,
              timings: salon.timings,
              distance: salon.distance,
              rating: salon.rating,
              salonTypeIds: salon.salonType,
              onBookNow: () {},
              onContactNow: () {},
            ),
          );
        },
      ),
    );
  }
}




// class NearbySalons extends StatefulWidget {
//   const NearbySalons({super.key});

//   @override
//   State<NearbySalons> createState() => _NearbySalonsState();
// }

// class _NearbySalonsState extends State<NearbySalons> {
//   late Future<List<Salon>> salons;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Salon>>(
//       future: salons,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No salons available'));
//         } else {
//           return SizedBox(
//             height: 330.h,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final salon = snapshot.data![index];
//                 return SizedBox(
//                   width: 230.w,
//                   child: SalonCard(
//                       imageUrl: salon.imageUrl,
//                       name: salon.name,
//                       status: salon.status,
//                       timings: salon.timings,
//                       distance: salon.distance,
//                       rating: salon.rating,
//                       salonTypeIds: salon.salonType,
//                       onBookNow: () {}),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }