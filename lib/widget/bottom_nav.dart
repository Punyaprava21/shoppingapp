import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final navBarHeight = width * 0.18;
    final iconSize = width * 0.065;
    final fontSize = width * 0.03;

    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        height: navBarHeight,
        padding: EdgeInsets.symmetric(
          vertical: width * 0.015,
          horizontal: width * 0.02,
        ),
        decoration: BoxDecoration(
          color: isDark ? kCardDark : kCardLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.2 : 0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 'Home', 0, isDark, iconSize, fontSize),
            _buildNavItem(
              Icons.book,
              'Bookings',
              1,
              isDark,
              iconSize,
              fontSize,
            ),
            _buildNavItem(
              Icons.person,
              'Profile',
              2,
              isDark,
              iconSize,
              fontSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    bool isDark,
    double iconSize,
    double fontSize,
  ) {
    final isSelected = currentIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                  : (isDark ? kSubtextDark : kSubtextLight),
              size: iconSize,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                    : (isDark ? kSubtextDark : kSubtextLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
