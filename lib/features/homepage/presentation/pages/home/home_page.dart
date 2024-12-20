import 'package:beglorious/features/homepage/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/config.dart';

import '../../../data/datasources/salon_remote_data_source.dart';
import '../../../data/datasources/specialists_remote_data_source.dart';

import '../../../data/repositories_impl/salon_repository_impl.dart';
import '../../../data/repositories_impl/specialist_repository_impl.dart';
import '../../../domain/repositories/salon_repository.dart';
import '../../../domain/repositories/specialist_repository.dart';
import '../../widgets/nearby_salons.dart';
import '../../widgets/nearby_specialists.dart';

import '../../widgets/section_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpecialistRepository specialistRepository;
  late SalonRepository salonRepository;

  @override
  void initState() {
    super.initState();

    // final salonRemoteDataSource = SalonRemoteDataSource();

    final salonRemoteDataSource =
        SalonRemoteDataSource(apiUrl: AppConfig.baseUrl);

    salonRepository =
        SalonRepositoryImpl(remoteDataSource: salonRemoteDataSource);

    // Initialize the SalonRepositoryImpl

    // Fetch salons
    // salons = salonRepository.fetchSalons();

    // Initialize the SpecialistRepositoryImpl (if applicable)
    final specialistRemoteDataSource =
        SpecialistRemoteDataSource(apiUrl: AppConfig.baseUrl);

    specialistRepository =
        SpecialistRepositoryImpl(remoteDataSource: specialistRemoteDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              // Header
              const TopBar(),
              SizedBox(height: 10.h),
              // Nearby Salons Section
              SectionHeader(title: 'Nearby Salons'),
              SizedBox(height: 10.h),
              NearbySalons(repository: salonRepository),
              SizedBox(height: 20.h),
              // Nearby Specialists Section
              SectionHeader(title: 'Nearby Specialists'),
              SizedBox(height: 10.h),
              NearbySpecialists(repository: specialistRepository),
              //NearbySalons(repository : salonRepository),
            ],
          ),
        ),
      ),
    );
  }
}
