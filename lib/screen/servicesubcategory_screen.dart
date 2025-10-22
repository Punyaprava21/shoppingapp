import 'package:customertech/screen/subcategorydetails_screen.dart';
import 'package:flutter/material.dart';

class ServiceSubcategoryScreen extends StatelessWidget {
  final String title;
  final Color color;

  const ServiceSubcategoryScreen({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final subcategories = [
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/679/679922.png',
        'name': '$title M2',
        'rating': '4.82 (64K reviews)',
        'price': '₹17,499',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/679/679922.png',
        'name': '$title M1',
        'rating': '4.85 (97K reviews)',
        'price': '₹14,499',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/679/679922.png',
        'name': '$title M0',
        'rating': '4.81 (213 reviews)',
        'price': '₹11,999',
      },
    ];

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF121212) : const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor:
            isDark ? const Color(0xFF1F1F1F) : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final item = subcategories[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ServiceDetailScreen(
                    title: item['name']!,
                    price: item['price']!,
                    image: item['image']!,
                    rating: item['rating']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                border: Border.all(
                  color:
                      isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE5E7EB),
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  if (!isDark)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item['image']!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['rating']!,
                          style: TextStyle(
                            color: isDark
                                ? Colors.grey[400]
                                : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['price']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDark ? color.withOpacity(0.9) : color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: isDark
                        ? Colors.grey[400]
                        : Colors.grey[600],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
