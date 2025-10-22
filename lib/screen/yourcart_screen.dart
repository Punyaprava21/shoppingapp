import 'package:customertech/controller/cart_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourCartScreen extends StatelessWidget {
  final String serviceName;
  final String price;

  const YourCartScreen({
    super.key,
    required this.serviceName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController(), permanent: false);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    // Initialize cart data when the screen is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.paymentSummary.isEmpty) {
        controller.serviceName.value = serviceName;
        controller.paymentSummary.assignAll([
          {'label': serviceName, 'value': price},
        ]);
      }
    });

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
        automaticallyImplyLeading: true, // Add back button
        title: Text(
          'Your Cart',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: getTextColor(isDark)),
        elevation: 0,
        centerTitle: false, // Align title to the left
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600, // Set maximum page width
            minWidth: 320, // Set minimum page width
          ),
          child: Obx(
            () => ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(kDefaultPadding),
              children: [
                if (controller.paymentSummary.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding * 2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 48,
                          color: isDark ? kSubtextDark : kSubtextLight,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your cart is empty',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? kSubtextDark : kSubtextLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ...controller.paymentSummary.map((item) {
                    final isMainService =
                        item['label'] == controller.serviceName.value;
                    final quantity = isMainService
                        ? controller.quantity.value
                        : 1;
                    final priceValue =
                        int.tryParse(
                          item['value']?.replaceAll('₹', '').trim() ?? '0',
                        ) ??
                        0;
                    final unitPrice = isMainService && quantity > 0
                        ? priceValue ~/ quantity
                        : priceValue;

                    return Card(
                      color: isDark ? kCardDark : kCardLight,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.electrical_services,
                          color: isDark
                              ? kPrimaryColorDark
                              : kPrimaryColorLight,
                          size: 24,
                        ),
                        title: Text(
                          item['label'] ?? 'Unknown Service',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDark ? kTextDark : kTextLight,
                          ),
                        ),
                        subtitle: Text(
                          isMainService
                              ? 'Qty: $quantity • ₹$unitPrice/unit'
                              : 'Electrical Service',
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark ? kSubtextDark : kSubtextLight,
                          ),
                        ),
                        trailing: Text(
                          item['value'] ?? '₹0',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? kPrimaryColorDark
                                : kPrimaryColorLight,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                const SizedBox(height: kDefaultPadding),
                // Phone number input
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => controller.phoneNumber.value = value,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(
                      color: isDark ? kSubtextDark : kSubtextLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                      borderSide: BorderSide(
                        color: isDark
                            ? kSubtextDark.withOpacity(0.5)
                            : kSubtextLight.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                      borderSide: BorderSide(
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                      borderSide: BorderSide(
                        color: isDark
                            ? kSubtextDark.withOpacity(0.5)
                            : kSubtextLight.withOpacity(0.5),
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.edit,
                      color: isDark ? kSubtextDark : kSubtextLight,
                    ),
                  ),
                  style: TextStyle(color: isDark ? kTextDark : kTextLight),
                ),
                const SizedBox(height: kDefaultPadding * 1.5),
                // Payment summary
                Text(
                  'Payment Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: isDark ? kCardDark : kCardLight,
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    border: Border.all(
                      color: isDark
                          ? kSubtextDark.withOpacity(0.5)
                          : kSubtextLight.withOpacity(0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ...controller.paymentSummary.map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['label'] ?? 'Unknown Service',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? kTextDark : kTextLight,
                                ),
                              ),
                              Text(
                                item['value'] ?? '₹0',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? kTextDark : kTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: isDark
                            ? kSubtextDark.withOpacity(0.5)
                            : kSubtextLight.withOpacity(0.5),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDark ? kTextDark : kTextLight,
                            ),
                          ),
                          Text(
                            controller.total.value,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? kPrimaryColorDark
                                  : kPrimaryColorLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 1.5),
                ElevatedButton.icon(
                  onPressed: () {
                    if (controller.phoneNumber.value.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Please enter a phone number',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    _showAddressSheet(context, isDark);
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                  label: Text(
                    'Add Address & Slot',
                    style: TextStyle(
                      color: isDark ? kTextDark : kTextDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? kPrimaryColorDark
                        : kPrimaryColorLight,
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                    ),
                    elevation: 0,
                    minimumSize: Size(
                      double.infinity,
                      size.height * 0.07,
                    ), // Full-width button
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddressSheet(BuildContext context, bool isDark) {
    final TextEditingController addressController = TextEditingController();
    String? selectedSlot;

    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: isDark ? kCardDark : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.6,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Drag Handle ---
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- Title ---
                  Text(
                    'Select Delivery Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- Saved Address Card (like Flipkart) ---
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDark
                            ? Colors.white24
                            : Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: isDark ? kCardDark.withOpacity(0.9) : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: isDark
                              ? kPrimaryColorDark
                              : kPrimaryColorLight,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "Default",
                                      style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "123, Sahid Nagar, Bhubaneswar, Odisha, 751007",
                                style: TextStyle(
                                  color: isDark
                                      ? Colors.white70
                                      : Colors.grey[700],
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 20),
                                ),
                                child: Text(
                                  "Change / Add New Address",
                                  style: TextStyle(
                                    color: isDark
                                        ? kPrimaryColorDark
                                        : kPrimaryColorLight,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // --- Time Slot Section ---
                  Text(
                    "Select Delivery Slot",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        [
                          "10:00 AM - 12:00 PM",
                          "12:00 PM - 2:00 PM",
                          "2:00 PM - 4:00 PM",
                          "4:00 PM - 6:00 PM",
                          "6:00 PM - 8:00 PM",
                        ].map((slot) {
                          final isSelected = selectedSlot == slot;
                          return StatefulBuilder(
                            builder: (context, setState) => GestureDetector(
                              onTap: () {
                                setState(() => selectedSlot = slot);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelected
                                      ? (isDark
                                            ? kPrimaryColorDark.withOpacity(0.2)
                                            : kPrimaryColorLight.withOpacity(
                                                0.2,
                                              ))
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isSelected
                                        ? (isDark
                                              ? kPrimaryColorDark
                                              : kPrimaryColorLight)
                                        : Colors.grey.withOpacity(0.4),
                                    width: 1.5,
                                  ),
                                ),
                                child: Text(
                                  slot,
                                  style: TextStyle(
                                    color: isSelected
                                        ? (isDark
                                              ? kPrimaryColorDark
                                              : kPrimaryColorLight)
                                        : (isDark
                                              ? Colors.white70
                                              : Colors.black87),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // --- Confirm Button ---
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedSlot == null) {
                          Get.snackbar(
                            'Please select a time slot',
                            '',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }
                        Get.back();
                        _showPaymentSheet(context, isDark);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark
                            ? kPrimaryColorDark
                            : kPrimaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: const Text(
                        'Confirm & Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showPaymentSheet(BuildContext context, bool isDark) {
    final controller = Get.find<CartController>();
    final size = MediaQuery.of(context).size;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: isDark ? kCardDark : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Text(
              'Payment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? kTextDark : kTextLight,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                size: 24,
              ),
              title: Text(
                'Credit/Debit Card',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
              trailing: Radio(
                value: 'card',
                groupValue: 'payment',
                onChanged: (_) {},
                activeColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet,
                color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                size: 24,
              ),
              title: Text(
                'UPI',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
              trailing: Radio(
                value: 'upi',
                groupValue: 'payment',
                onChanged: (_) {},
                activeColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.money,
                color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                size: 24,
              ),
              title: Text(
                'Cash on Delivery',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
              trailing: Radio(
                value: 'cash',
                groupValue: 'payment',
                onChanged: (_) {},
                activeColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Total: ${controller.total.value}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? kTextDark : kTextLight,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'Success',
                  'Payment processed successfully!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? kPrimaryColorDark
                    : kPrimaryColorLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Confirm Payment',
                style: TextStyle(
                  color: isDark ? kTextDark : kTextLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
