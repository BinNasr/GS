import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String specialty;
  final String distance;
  final double rating;
  final bool isAd;
  final bool isFavorite;
  final bool isFreelancer;
  final bool isFeatured;

  const SpecialistCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.specialty,
      required this.distance,
      required this.rating,
      required this.isAd,
      required this.isFavorite,
      required this.isFeatured,
      required this.isFreelancer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 20.h, // Increased height
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: Image.network(
                  imageUrl,
                  height: 100.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Specialty, Distance, and Name
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          specialty,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.sp),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 14.w, color: Colors.amber),
                            SizedBox(width: 2.w),
                            Text(distance,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Tag
              if (isAd || isFeatured)
                Padding(
                  padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: isAd ? Colors.amber : Colors.orange,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      isAd ? 'Ad' : 'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Rating
          Positioned(
            top: 10.h,
            left: 10.w, // Adjusted position
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Icon(Icons.star, size: 12.w, color: Colors.amber),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Circle
          Positioned(
            top: 5.h,
            left: 5.w,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                child: Icon(
                  isFreelancer ? Icons.person : Icons.home,
                  size: 20.w,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),

          // Favorite Icon
          Positioned(
            top: 10.h,
            right: 8.w,
            child: Icon(
              Icons.favorite_border,
              size: 20.w,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
