import 'dart:async';
import 'package:customertech/controller/banner_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferBannerScreen extends StatelessWidget {
  final bool isDark;
  final BannerController controller;

  const OfferBannerScreen({
    super.key,
    required this.isDark,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final banners = [
      {
        'title': 'Diwali AC Offer',
        'subtitle': '30% off on AC Services',
        'icon': Icons.ac_unit,
        'gradient': [
          isDark ? kPrimaryColorDark : kPrimaryColorLight,
          isDark ? kSecondaryColorDark : kSecondaryColorLight,
        ],
      },
      {
        'title': 'Durga Puja Fan Service',
        'subtitle': '25% off on Fan Repairs',
        'icon': Icons.electrical_services,
        'gradient': [
          isDark ? kSecondaryColorDark : kSecondaryColorLight,
          isDark ? kPrimaryColorDark : kPrimaryColorLight,
        ],
      },
      {
        'title': 'Special Plumbing Deal',
        'subtitle': '20% off on Plumbing Work',
        'icon': Icons.plumbing,
        'gradient': [
          isDark ? kAccentColorDark : kAccentColorLight,
          isDark ? kPrimaryColorDark : kPrimaryColorLight,
        ],
      },
    ];

    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (controller.pageController.hasClients) {
        int nextPage = controller.pageController.page!.toInt() + 1;
        if (nextPage >= banners.length) nextPage = 0;
        controller.pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.updatePage,
              itemCount: banners.length,
              itemBuilder: (context, index) {
                final banner = banners[index];
                return _buildBannerCard(
                  context,
                  banner['title'] as String,
                  banner['subtitle'] as String,
                  banner['icon'] as IconData,
                  banner['gradient'] as List<Color>,
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPage.value == index ? 30 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                        : (isDark ? kSubtextDark : kSubtextLight).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    List<Color> gradientColors,
  ) {
    final textColor = Colors.white;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/service-detail',
          arguments: {
            'title': title,
            'price': '₹399',
            'image': 'https://example.com/electrical_service.png',
            'rating': '4.7',
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: const GradientRotation(0.2), // Subtle parallax effect
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(isDark ? 0.5 : 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: textColor, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor.withOpacity(0.9),
                      fontSize: 14,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}