import 'package:customertech/screen/all_services_screen.dart';
import 'package:customertech/screen/popular_service_seeall_screen.dart';
import 'package:customertech/screen/servicesubcategory_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildPopularServices(BuildContext context) {
  final data = [
    {
      'icon': Icons.cleaning_services,
      'name': 'Cleaning',
      'color': Colors.orangeAccent,
    },
    {'icon': Icons.plumbing, 'name': 'Plumbing', 'color': Colors.blueAccent},
    {
      'icon': Icons.electrical_services,
      'name': 'Electrical',
      'color': Colors.purpleAccent,
    },
    {'icon': Icons.format_paint, 'name': 'Painting', 'color': Colors.teal},
  ];

  final isDark = Theme.of(context).brightness == Brightness.dark;
  final size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.045,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => const AllServicesScreen()),
              child: Text(
                "See All",
                style: TextStyle(
                  color: const Color(0xFF8B5CF6),
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.037,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: size.height * 0.14,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, i) {
            final service = data[i];
            return GestureDetector(
              onTap: () {
                Get.to(() => ServiceSubcategoryScreen(
                      title: service['name'] as String,
                      color: service['color'] as Color,
                    ));
              },
              child: Container(
                width: size.width * 0.28,
                margin: EdgeInsets.only(right: i < data.length - 1 ? 12 : 0),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1F1F1F) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  boxShadow: [
                    if (!isDark)
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      service['icon'] as IconData,
                      size: size.width * 0.1,
                      color: service['color'] as Color,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service['name'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
