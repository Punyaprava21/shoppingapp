import 'package:customertech/screen/all_services_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepairinstallationScreen extends StatelessWidget {
  final bool isDark;

  const RepairinstallationScreen({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeight = size.height * 0.12; 

    final categories = [
      {
        'icon': Icons.toys,
        'label': 'Table Fan',
        'color': isDark ? kPrimaryColorDark : kPrimaryColorLight,
      },
      {
        'icon': Icons.emoji_objects,
        'label': 'Ceiling Fan',
        'color': isDark ? kSecondaryColorDark : kSecondaryColorLight,
      },
      {
        'icon': Icons.air,
        'label': 'Exhaust Fan',
        'color': isDark ? kAccentColorDark : kAccentColorLight,
      },
      {
        'icon': Icons.ac_unit,
        'label': 'Window AC',
        'color': isDark ? const Color(0xFFEC4899) : const Color(0xFFF472B6),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Repair & Installation',
                    style: TextStyle(
                      fontSize: size.width * 0.045, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: isDark ? kTextDark : kTextLight,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const AllServicesScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0, // Adjusted to prevent overflow
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return _buildCategoryCard(
                    icon: category['icon'] as IconData,
                    label: category['label'] as String,
                    color: category['color'] as Color,
                    height: cardHeight,
                    isDark: isDark,
                    maxWidth: constraints.maxWidth,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required Color color,
    required double height,
    required bool isDark,
    required double maxWidth,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to service details
      },
      child: ClipOval(
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? kCardDark : kCardLight,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.15),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.45,
                width: height * 0.45,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: height * 0.25),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: maxWidth * 0.03, // Responsive font size
                    color: isDark ? kTextDark : kTextLight,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
