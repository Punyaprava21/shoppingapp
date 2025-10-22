import 'package:customertech/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildHeader(BuildContext context,{required String userName}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.person, color: Color(0xFF6366F1)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Deliver to",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  
                   'Hello, $userName!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {
              Get.to(() => NotificationScreen());
            },
          ),
        ),
      ],
    ),
  );
}