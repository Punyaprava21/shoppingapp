import 'package:customertech/screen/servicesubcategory_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildMostBookedServices(BuildContext context) {
  final items = [
    {'name': 'Home Cleaning', 'price': '₹499'},
    {'name': 'Full House Paint', 'price': '₹1299'},
  ];

  final isDark = Theme.of(context).brightness == Brightness.dark;
  final size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // --- Header with "See All" ---
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Most Booked Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.045,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => ServiceSubcategoryScreen(
                    title: "Most Booked Services",
                    color: Colors.orangeAccent,
                  ),
                );
              },
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

      // --- Horizontal List of Services ---
      SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, index) => Container(
            width: 220,
            margin: EdgeInsets.only(right: index < items.length - 1 ? 12 : 0),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.15)),
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
              ],
            ),
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  items[index]['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  items[index]['price']!,
                  style: const TextStyle(
                    color: kPrimaryColorLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColorLight,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
