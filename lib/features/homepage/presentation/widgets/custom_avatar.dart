import 'package:flutter/material.dart';

//A reusable avatar with the ability to handle different image paths, sizes, and border colors.

class CustomAvatar extends StatelessWidget {
  final String imagePath;
  final double radius;
  final Color borderColor;

  const CustomAvatar({
    Key? key,
    required this.imagePath,
    this.radius = 24,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: borderColor,
    );
  }
}
