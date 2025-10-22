import 'package:customertech/screen/all_services_screen.dart';
import 'package:customertech/screen/servicesubcategory_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherServices extends StatelessWidget {
  final bool isDark;
  final BoxConstraints constraints;

  const OtherServices({
    super.key,
    required this.isDark,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemWidth = (size.width - 48) / 3;

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
      {
        'icon': Icons.ac_unit_outlined,
        'label': 'Split AC',
        'color': isDark ? const Color(0xFF22D3EE) : const Color(0xFF06B6D4),
      },
      {
        'icon': Icons.thermostat,
        'label': 'Central AC',
        'color': isDark ? const Color(0xFF8B5CF6) : const Color(0xFFA78BFA),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Other Services',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => Get.to(() => const AllServicesScreen()),
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return _buildCategoryItem(
                context,
                isDark,
                category['icon'] as IconData,
                category['label'] as String,
                category['color'] as Color,
                itemWidth,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    bool isDark,
    IconData icon,
    String label,
    Color color,
    double width,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ServiceSubcategoryScreen(title: label, color: color));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..rotateZ(0.05)
          ..scale(1.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? kCardDark : kCardLight,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.4,
                height: width * 0.4,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: width * 0.25),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? kTextDark : kTextLight,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
