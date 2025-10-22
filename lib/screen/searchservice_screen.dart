import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultScreen extends StatelessWidget {
  final String serviceType;

  const SearchResultScreen({super.key, required this.serviceType});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    // Sample service categories (mimicking the image)
    final serviceCategories = [
      {'icon': Icons.fax, 'label': 'Fan', 'price': '₹89'},
      {'icon': Icons.power, 'label': 'Switch & socket', 'price': '₹50'},
      {'icon': Icons.lightbulb, 'label': 'Wall/ceiling light', 'price': '₹70'},
      {'icon': Icons.settings, 'label': 'Wiring', 'price': '₹120'},
      {'icon': Icons.doorbell, 'label': 'Doorbell', 'price': '₹60'},
      {'icon': Icons.power_settings_new, 'label': 'MCB & submeter', 'price': '₹150'},
      {'icon': Icons.battery_charging_full, 'label': 'Inverter & stabiliser', 'price': '₹200'},
      {'icon': Icons.menu, 'label': 'Menu', 'price': 'N/A'},
      {'icon': Icons.person, 'label': 'Book a consultation', 'price': '₹300'},
    ];

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: isDark ? kTextDark : kTextDark,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          serviceType,
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: isDark ? kTextDark : kTextDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '★ 4.8 (4.9M bookings)',
                              style: TextStyle(
                                fontSize: size.width * 0.035,
                                color: isDark ? kSubtextDark : kSubtextLight,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '.....',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  color: isDark ? kSubtextDark : kSubtextLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: isDark ? kTextDark : kTextLight),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: isDark ? kTextDark : kTextLight),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Instant',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'In 45 mins',
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: isDark ? kSubtextDark : kSubtextLight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B5CF6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Save 10% on every order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Mobikwik',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Via Mobikwik',
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: isDark ? kSubtextDark : kSubtextLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Service Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: serviceCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final category = serviceCategories[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to service detail page
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: isDark ? kCardDark : kCardLight,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              category['icon'] as IconData,
                              size: 30,
                              color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['label'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDark ? kTextDark : kTextLight,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (category['price'] != 'N/A')
                            Text(
                              category['price'] as String,
                              style: TextStyle(
                                fontSize: size.width * 0.03,
                                color: isDark ? kSubtextDark : kSubtextLight,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom Cart Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? kCardDark : kCardLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹238',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: isDark ? kTextDark : kTextLight,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to cart
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5CF6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'View Cart',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.white,
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