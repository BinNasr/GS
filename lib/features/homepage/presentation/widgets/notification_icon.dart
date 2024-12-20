import 'package:flutter/material.dart';

//A reusable notification icon with a badge.

class NotificationIcon extends StatelessWidget {
  final IconData icon;
  final int badgeCount;

  const NotificationIcon({
    Key? key,
    required this.icon,
    required this.badgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon, size: 30),
        if (badgeCount > 0)
          Positioned(
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                '$badgeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
