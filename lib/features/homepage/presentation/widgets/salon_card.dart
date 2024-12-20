import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/salon_type_icon_mapper.dart';

class SalonCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String status;
  final String timings;
  final String distance;
  final double rating;
  final List<int> salonTypeIds; // List of type IDs
  final VoidCallback onBookNow;
  final VoidCallback onContactNow;

  const SalonCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.status,
      required this.timings,
      required this.distance,
      required this.rating,
      required this.salonTypeIds,
      required this.onBookNow,
      required this.onContactNow});

  /// Builds the salon type icons dynamically
  Widget _buildSalonTypeIcons() {
    return Row(
      children: salonTypeIds.map((id) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SvgPicture.asset(
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            SalonTypeIconMapper.getIconPath(id),
            // width: 10.w,
            height: 15.h,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.r),
      child: Container(
        height: 226.h,
        width: 200.w,
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: const Color(0xFF23211C),
          borderRadius: BorderRadius.circular(7.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                        bottomLeft: Radius.circular(2.r),
                        bottomRight: Radius.circular(2.r),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 350.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error,
                              size: 50.w, color: Colors.red);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    //rating
                    top: 16.h,
                    left: 16.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star,
                              size: 15.w, color: const Color(0xFFA58430)),
                          SizedBox(width: 4.w),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    //favourite icon "heart"
                    top: 8.h,
                    right: 8.w,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border,
                          color: Colors.white, size: 20.w),
                    ),
                  ),
                ],
              ),
            ),

            // Details Section
            Padding(
              //open Now status
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: status == 1
                              ? const Color(0xFFFFB908)
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                        timings,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color.fromARGB(255, 214, 214, 214)),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.h),
                  Row(children: [
                    Text(
                      //salon name
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ]),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Aligns items to start and end
                    children: [
                      Row(
                        // Inner Row for Icon and Text
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14.w,
                            color: const Color(0xFFA58430),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "$distance KM",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      _buildSalonTypeIcons(), // This will be pushed to the end
                    ],
                  ),
                ],
              ),
            ),
            // Dynamic Icons for Salon Types
            // Button Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: onBookNow,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(35.w, 30.h),
                      backgroundColor: const Color(0xFF505050),
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                    ),
                    child: Icon(Icons.message_outlined,
                        size: 20.w, color: const Color(0xFFFFFFFF)),
                  ),
                  ElevatedButton(
                    onPressed: onContactNow,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(135.w, 30.h),
                      backgroundColor: const Color(0xFF505050),
                      padding: EdgeInsets.symmetric(vertical: 0.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                    ),
                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
