import 'package:customertech/screen/yourcart_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:customertech/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultScreen extends StatelessWidget {
  final String serviceType;

  const SearchResultScreen({super.key, required this.serviceType});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final CartController cartController = Get.put(CartController());

    final RxBool isSearching = false.obs;
    final RxString searchQuery = ''.obs;

    final fanServices = [
      {
        'id': 1,
        'title': 'Fan installation',
        'rating': '4.84',
        'reviews': '58K reviews',
        'price': 89,
        'desc':
            'Includes installation of a ceiling or wall fan. Technician ensures proper wiring and secure mounting.',
        'image': 'https://cdn-icons-png.flaticon.com/512/219/219816.png',
        'options': '4 options',
      },
      {
        'id': 2,
        'title': 'Fan uninstallation (ceiling/exhaust)',
        'rating': '4.88',
        'reviews': '14K reviews',
        'price': 69,
        'desc':
            'Technician safely removes your ceiling or exhaust fan without damaging wiring or fixtures.',
        'image': 'https://cdn-icons-png.flaticon.com/512/1041/1041888.png',
        'options': '30 mins',
      },
      {
        'id': 3,
        'title': 'Fan replacement (ceiling/exhaust)',
        'rating': '4.83',
        'reviews': '21K reviews',
        'price': 80,
        'desc':
            'Replacement service includes removal of old fan and installation of a new one (same point).',
        'image': 'https://cdn-icons-png.flaticon.com/512/1041/1041892.png',
        'options': '2 options',
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,

      // ✅ Bottom cart section
      bottomNavigationBar: Obx(
        () => Container(
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
                '₹${cartController.totalPrice.value}',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => YourCartScreen(
                      serviceName: fanServices[0]['title'] as String,
                      price: '₹${fanServices[0]['price']}',
                    ),
                  );
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
      ),

      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: isDark ? kTextDark : kTextLight,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isSearching.value
                              ? TextField(
                                  onChanged: (val) => searchQuery.value = val,
                                  decoration: InputDecoration(
                                    hintText: "Search service...",
                                    isDense: true,
                                    hintStyle: TextStyle(
                                      color: isDark
                                          ? kSubtextDark
                                          : kSubtextLight,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: isDark
                                            ? Colors.grey
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: isDark ? kTextDark : kTextLight,
                                    fontSize: 14,
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serviceType,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isDark ? kTextDark : kTextLight,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '★ 4.8 (4.9M bookings)',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: isDark
                                            ? kSubtextDark
                                            : kSubtextLight,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isSearching.value ? Icons.close : Icons.search,
                          color: isDark ? kTextDark : kTextLight,
                        ),
                        onPressed: () => isSearching.toggle(),
                      ),
                    ],
                  ),
                ),

                // 🔹 Fan Services
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fan Services",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? kTextDark : kTextLight,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // 🔹 Filter + List
                      ...fanServices
                          .where(
                            (s) => s['title'].toString().toLowerCase().contains(
                              searchQuery.value.toLowerCase(),
                            ),
                          )
                          .map((service) {
                            final id = service['id'] as int;
                            final price = service['price'] as int;

                            return GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: isDark ? kCardDark : Colors.white,
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 40,
                                            height: 4,
                                            margin: const EdgeInsets.only(
                                              bottom: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          service['title'] as String,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          service['desc'] as String,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: isDark
                                                ? kSubtextDark
                                                : kSubtextLight,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: isDark ? kCardDark : kCardLight,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ✅ Left-aligned text section
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              service['title'] as String,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 14,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "${service['rating']} (${service['reviews']})",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: isDark
                                                        ? kSubtextDark
                                                        : kSubtextLight,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "₹$price",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: isDark
                                                    ? kSubtextDark
                                                    : kSubtextLight,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            GestureDetector(
                                              onTap: () {
                                                Get.bottomSheet(
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          16,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: isDark
                                                          ? kCardDark
                                                          : Colors.white,
                                                      borderRadius:
                                                          const BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                  20,
                                                                ),
                                                          ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            width: 40,
                                                            height: 4,
                                                            margin:
                                                                const EdgeInsets.only(
                                                                  bottom: 12,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .grey[400],
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        4,
                                                                      ),
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          service['title']
                                                              as String,
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          service['desc']
                                                              as String,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: isDark
                                                                ? kSubtextDark
                                                                : kSubtextLight,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "View details",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF8B5CF6),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // ✅ Right side: image + counter
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.network(
                                              service['image'] as String,
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Obx(() {
                                            final count =
                                                cartController.itemCounts[id] ??
                                                0;
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFF8B5CF6,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => cartController
                                                        .decrementItem(
                                                          id,
                                                          price,
                                                        ),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      size: 18,
                                                      color: Color(0xFF8B5CF6),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    "$count",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  GestureDetector(
                                                    onTap: () => cartController
                                                        .incrementItem(
                                                          id,
                                                          price,
                                                        ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      size: 18,
                                                      color: Color(0xFF8B5CF6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                          const SizedBox(height: 4),
                                          Text(
                                            service['options'] as String,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: isDark
                                                  ? kSubtextDark
                                                  : kSubtextLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
