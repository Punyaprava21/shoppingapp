import 'package:customertech/screen/yourcart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/colors.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String rating;

  const ServiceDetailScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final reviews = [
      {
        "name": "Amit Kumar",
        "text":
            "Excellent service! Technician arrived on time and explained everything clearly.",
        "date": "15 Sep 2025",
      },
      {
        "name": "Riya Sharma",
        "text":
            "My AC is working perfectly now. Very polite technician, highly recommended.",
        "date": "12 Oct 2025",
      },
      {
        "name": "Karan Verma",
        "text":
            "Smooth installation and quick service. Definitely worth the money!",
        "date": "10 Oct 2025",
      },
    ];

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF121212)
          : const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        elevation: 0.8,
        iconTheme: IconThemeData(color: getTextColor(isDark)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          // Service Image
          ClipRRect(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            child: Image.network(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Title and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: getTextColor(isDark),
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: getAccentColor(isDark), size: 20),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: getTextColor(isDark),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            "Verified Service • 1000+ customers served",
            style: TextStyle(color: getSubtextColor(isDark), fontSize: 12),
          ),
          const SizedBox(height: 16),

          // Price Section
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: getCardColor(isDark),
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              border: Border.all(
                color: isDark
                    ? getSubtextColor(isDark).withOpacity(0.3)
                    : Colors.grey.shade200,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: getSecondaryColor(isDark, theme: ''),
                  ),
                ),
                Text(
                  "Inclusive of all taxes",
                  style: TextStyle(
                    fontSize: 12,
                    color: getSubtextColor(isDark),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Description
          Text(
            "Service Details",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: getTextColor(isDark),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Our certified technicians provide reliable and professional service for all types of electrical appliances such as ACs, fans, and wiring. We ensure proper inspection, repair, and installation with guaranteed satisfaction.",
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: getSubtextColor(isDark),
            ),
          ),
          const SizedBox(height: 20),

          // Reviews Section
          Text(
            "Customer Reviews",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: getTextColor(isDark),
            ),
          ),
          const SizedBox(height: 10),

          ...reviews.map(
            (r) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: getCardColor(isDark),
                borderRadius: BorderRadius.circular(kCardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    r["text"]!,
                    style: TextStyle(
                      fontSize: 13,
                      color: getTextColor(isDark),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r["name"]!,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: getTextColor(isDark),
                        ),
                      ),
                      Text(
                        r["date"]!,
                        style: TextStyle(
                          fontSize: 12,
                          color: getSubtextColor(isDark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Show more reviews",
                style: TextStyle(
                  color: getPrimaryColor(isDark),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),

      // Bottom Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: getCardColor(isDark),
          border: Border(
            top: BorderSide(color: getSubtextColor(isDark).withOpacity(0.3)),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: getSecondaryColor(isDark, theme: ''),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(
                    () => YourCartScreen(serviceName: title, price: price),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 18,
                  color: isDark ? Colors.white : Colors.white,
                ),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: getPrimaryColor(isDark),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
