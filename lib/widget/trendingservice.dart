import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';

class TrendingServicesScreen extends StatelessWidget {
  const TrendingServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    final services = [
      {
        'icon': Icons.toys,
        'label': 'Table Fan',
        'discount': '10% OFF',
        'gradient': [const Color(0xFF4B5EFC), const Color(0xFF60A5FA)],
      },
      {
        'icon': Icons.emoji_objects,
        'label': 'Ceiling Fan',
        'discount': '15% OFF',
        'gradient': [const Color(0xFF10B981), const Color(0xFF34D399)],
      },
      {
        'icon': Icons.air,
        'label': 'Exhaust Fan',
        'discount': '20% OFF',
        'gradient': [const Color(0xFFF59E0B), const Color(0xFFFBBF24)],
      },
      {
        'icon': Icons.ac_unit,
        'label': 'Window AC',
        'discount': '25% OFF',
        'gradient': [const Color(0xFFEC4899), const Color(0xFFF472B6)],
      },
      {
        'icon': Icons.ac_unit_outlined,
        'label': 'Split AC',
        'discount': '30% OFF',
        'gradient': [const Color(0xFF06B6D4), const Color(0xFF67E8F9)],
      },
      {
        'icon': Icons.thermostat,
        'label': 'Central AC',
        'discount': '35% OFF',
        'gradient': [getPrimaryColor(isDark), getPrimaryColor(isDark).withOpacity(0.6)],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Trending Services')),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            final gradientColors = service['gradient'] as List<Color>;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: gradientColors[0].withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                service['icon'] as IconData,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                service['discount'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          service['label'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}