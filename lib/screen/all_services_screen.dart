import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final allServices = [
      {'icon': Icons.electrical_services, 'title': 'Electrical Repair'},
      {'icon': Icons.emoji_objects, 'title': 'Light Fitting & Replacement'},
      {'icon': Icons.power, 'title': 'Power Socket Repair'},
      {'icon': Icons.cable, 'title': 'Wiring Installation'},
      {'icon': Icons.toys, 'title': 'Table Fan Repair'},
      {'icon': Icons.emoji_objects_outlined, 'title': 'Ceiling Fan Repair'},
      {'icon': Icons.air, 'title': 'Exhaust Fan Service'},
      {'icon': Icons.lightbulb_outline, 'title': 'Tube Light & LED Setup'},
      {'icon': Icons.settings_input_component, 'title': 'Switch Board Repair'},
      {'icon': Icons.bolt, 'title': 'Inverter Setup'},
      {'icon': Icons.charging_station, 'title': 'MCB & Fuse Repair'},
      {'icon': Icons.flash_on, 'title': 'Full Home Electrical Check'},
    ];

    final colorPalette = [
      isDark ? kPrimaryColorDark : kPrimaryColorLight,
      isDark ? kSecondaryColorDark : kSecondaryColorLight,
      isDark ? kAccentColorDark : kAccentColorLight,
    ];

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        title: Text(
          'All Services',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
            letterSpacing: 0.3,
          ),
        ),
        backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
        elevation: 0.8,
        leading: Semantics(
          label: 'Back to previous screen',
          child: IconButton(
            icon: Icon(Icons.arrow_back,  color: isDark ? Colors.white : Colors.black,),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(kDefaultPadding),
        itemCount: allServices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: kDefaultPadding,
          crossAxisSpacing: kDefaultPadding,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final service = allServices[index];
          final color = colorPalette[index % colorPalette.length];
          return _buildServiceItem(
            context,
            isDark,
            service['icon'] as IconData,
            service['title'] as String,
            color,
          );
        },
      ),
    );
  }

  Widget _buildServiceItem(
    BuildContext context,
    bool isDark,
    IconData icon,
    String title,
    Color color,
  ) {
    return Semantics(
      label: 'Service: $title',
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/service-details', arguments: {'title': title});
        },
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: isDark ? kCardDark : kCardLight,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            border: Border.all(
              color: isDark
                  ? kSubtextDark.withOpacity(0.5)
                  : kSubtextLight.withOpacity(0.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: kDefaultPadding),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? kTextDark : kTextLight,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
