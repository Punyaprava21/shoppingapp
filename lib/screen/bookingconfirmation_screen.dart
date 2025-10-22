import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/constant.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String bookingId;
  final String technicianName;
  final String charge;
  final String serviceTitle;
  final DateTime date;
  final TimeOfDay time;
  final String paymentMethod;

  const BookingConfirmationScreen({
    super.key,
    required this.bookingId,
    required this.technicianName,
    required this.charge,
    required this.serviceTitle,
    required this.date,
    required this.time,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        title: Text(
          "Booking Confirmation",
          style: TextStyle(
            fontSize: 18,
            color: isDark ? kTextDark : kTextLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: isDark ? kTextDark : kTextLight),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // ✅ Success Animation / Icon
              Semantics(
                label: 'Booking confirmed successfully',
                child: Container(
                  width: size.width * 0.28,
                  height: size.width * 0.28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        isDark ? kSecondaryColorDark : kSecondaryColorLight,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                    size: 80,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Text(
                "Booking Confirmed!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Your service has been successfully booked.",
                style: TextStyle(
                  color: isDark ? kSubtextDark : kSubtextLight,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // ✅ Booking Details Card
              Semantics(
                label: 'Booking details',
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: isDark ? kCardDark : kCardLight,
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    border: Border.all(
                      color: isDark ? kSubtextDark.withOpacity(0.5) : kSubtextLight.withOpacity(0.5),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow("Booking ID", bookingId, isDark),
                      Divider(
                        height: 18,
                        color: isDark ? kSubtextDark.withOpacity(0.3) : kSubtextLight.withOpacity(0.3),
                      ),
                      _buildInfoRow("Service", serviceTitle, isDark),
                      _buildInfoRow("Technician", technicianName, isDark),
                      _buildInfoRow(
                        "Date & Time",
                        "${date.day}/${date.month}/${date.year} • ${time.format(context)}",
                        isDark,
                      ),
                      _buildInfoRow("Payment", paymentMethod, isDark),
                      Divider(
                        height: 18,
                        color: isDark ? kSubtextDark.withOpacity(0.3) : kSubtextLight.withOpacity(0.3),
                      ),
                      _buildInfoRow("Total Paid", charge, isDark, bold: true),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // ✅ Back to Home Button
              Semantics(
                label: 'Back to home screen',
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      foregroundColor: isDark ? kTextDark : kTextLight,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String title,
    String value,
    bool isDark, {
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDark ? kSubtextDark : kSubtextLight,
              fontSize: 14,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 15,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                color: bold
                    ? (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                    : (isDark ? kTextDark : kTextLight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}