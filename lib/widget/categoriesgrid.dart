import 'package:customertech/screen/all_services_screen.dart';
import 'package:customertech/screen/servicesubcategory_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCategoriesGrid(BuildContext context) {
  final cats = [
    {
      'name': 'AC Repair',
      'icon': Icons.ac_unit,
      'color': Colors.lightBlueAccent,
    },
    {'name': 'Salon', 'icon': Icons.content_cut, 'color': Colors.pinkAccent},
    {
      'name': 'Painting',
      'icon': Icons.format_paint,
      'color': Colors.orangeAccent,
    },
    {
      'name': 'Laundry',
      'icon': Icons.local_laundry_service,
      'color': Colors.indigoAccent,
    },
    {'name': 'Shifting', 'icon': Icons.local_shipping, 'color': Colors.green},
    {
      'name': 'Cleaning',
      'icon': Icons.cleaning_services,
      'color': Colors.purpleAccent,
    },
  ];

  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All Categories",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to same screen with "All Categories"
                Get.to(() => AllServicesScreen());
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  color: Color(0xFF8B5CF6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cats.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            final item = cats[index];

            return GestureDetector(
              onTap: () {
                Get.to(
                  () => ServiceSubcategoryScreen(
                    title: item['name'] as String,
                    color: item['color'] as Color,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isDark
                        ? const Color(0xFF2C2C2C)
                        : Colors.grey.withOpacity(0.2),
                  ),
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
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: (item['color'] as Color).withOpacity(
                        0.15,
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        size: 24,
                        color: item['color'] as Color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['name'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
