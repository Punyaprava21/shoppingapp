import 'package:customertech/screen/searchresult_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchText = ''.obs;
  final TextEditingController searchController = TextEditingController();

  void updateSearch(String value) {
    searchText.value = value;
  }

  void clearSearch() {
    searchController.clear();
    updateSearch('');
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController controller = Get.put(SearchController());
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Sample recent searches
    final recentSearches = [
      {
        'title': 'Fan installation',
        'price': 'Starts at ₹89',
        'category': 'Electrician',
      },
      {
        'title': 'AC Service',
        'price': 'Starts at ₹299',
        'category': 'AC Repair',
      },
    ];

    // Trending electrical services
    final trendingSearches = [
      'Fan Repair',
      'AC Service',
      'Laptop Repair',
      'Light & Wiring',
      'TV Installation',
      'Refrigerator Repair',
      'Washing Machine Repair',
      'Microwave Repair',
      'Geyser Repair',
      'Computer Setup',
    ];

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Obx(
                      () => TextField(
                        controller: controller.searchController,
                        onChanged: controller.updateSearch,
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF1E293B),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Look for services',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: isDark
                                ? const Color(0xFF64748B)
                                : const Color(0xFF94A3B8),
                          ),
                          filled: true,
                          fillColor: isDark
                              ? const Color(0xFF1E293B)
                              : Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          suffixIcon: controller.searchText.value.isNotEmpty
                              ? GestureDetector(
                                  onTap: controller.clearSearch,
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: isDark
                                        ? const Color(0xFF64748B)
                                        : const Color(0xFF94A3B8),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recent Searches
                    if (recentSearches.isNotEmpty) ...[
                      Text(
                        'Recents',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...recentSearches.map(
                        (recent) => GestureDetector(
                          onTap: () {
                            controller.searchController.text = recent['title']!;
                            controller.updateSearch(recent['title']!);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? const Color(
                                            0xFF334155,
                                          ).withOpacity(0.5)
                                        : const Color(0xFFF1F5F9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.history,
                                    color: isDark
                                        ? const Color(0xFF94A3B8)
                                        : const Color(0xFF64748B),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recent['title']!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: isDark
                                              ? Colors.white
                                              : const Color(0xFF1E293B),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            recent['price']!,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: isDark
                                                  ? const Color(0xFF94A3B8)
                                                  : const Color(0xFF64748B),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                            width: 3,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              color: isDark
                                                  ? const Color(0xFF64748B)
                                                  : const Color(0xFF94A3B8),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Text(
                                            recent['category']!,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: isDark
                                                  ? const Color(0xFF94A3B8)
                                                  : const Color(0xFF64748B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],

                    // Trending Electrical Services
                    Text(
                      'Trending Electrical Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 12,
                      children: trendingSearches
                          .map(
                            (service) => GestureDetector(
                              onTap: () {
                                controller.searchController.text = service;
                                controller.updateSearch(service);
                                Get.to(
                                  () =>
                                      SearchResultScreen(serviceType: service),
                                );
                              },

                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF1E293B)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: isDark
                                        ? const Color(0xFF334155)
                                        : const Color(0xFFE2E8F0),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.electrical_services,
                                      size: 16,
                                      color: isDark
                                          ? const Color(0xFF94A3B8)
                                          : const Color(0xFF64748B),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      service,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: isDark
                                            ? const Color(0xFFCBD5E1)
                                            : const Color(0xFF475569),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
