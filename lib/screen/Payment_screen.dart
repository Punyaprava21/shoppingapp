import 'package:customertech/screen/bookingconfirmation_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentScreen extends StatefulWidget {
  final String technicianName;
  final String charge;
  final String serviceTitle;
  final DateTime date;
  final TimeOfDay time;

  const PaymentScreen({
    super.key,
    required this.technicianName,
    required this.charge,
    required this.serviceTitle,
    required this.date,
    required this.time,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = "UPI";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(
            color: isDark ? kTextDark : kTextLight,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
        iconTheme: IconThemeData(color: isDark ? kTextDark : kTextLight),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Service summary card
            Semantics(
              label: 'Service summary for ${widget.serviceTitle}',
              child: Container(
                padding: const EdgeInsets.all(16),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.serviceTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark ? kTextDark : kTextLight,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Technician: ${widget.technicianName}",
                      style: TextStyle(
                        color: isDark ? kSubtextDark : kSubtextLight,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "Date: ${widget.date.day}/${widget.date.month}/${widget.date.year} • ${widget.time.format(context)}",
                      style: TextStyle(
                        color: isDark ? kSubtextDark : kSubtextLight,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            color: isDark ? kSubtextDark : kSubtextLight,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.charge,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Payment method selection
            Text(
              "Select Payment Method",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? kTextDark : kTextLight,
              ),
            ),
            const SizedBox(height: 12),

            _buildPaymentOption("UPI", Icons.account_balance_wallet, isDark),
            _buildPaymentOption("Credit / Debit Card", Icons.credit_card, isDark),
            _buildPaymentOption("Cash on Delivery", Icons.money, isDark),

            const SizedBox(height: 30),

            // 🔹 Pay Now Button
            Semantics(
              label: 'Confirm and pay for service',
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => BookingConfirmationScreen(
                        bookingId: "BK${DateTime.now().millisecondsSinceEpoch}",
                        technicianName: widget.technicianName,
                        charge: widget.charge,
                        serviceTitle: widget.serviceTitle,
                        date: widget.date,
                        time: widget.time,
                        paymentMethod: _selectedMethod,
                      ),
                    );
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
                    "Confirm & Pay",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Payment Option Widget
  Widget _buildPaymentOption(String label, IconData icon, bool isDark) {
    final isSelected = _selectedMethod == label;
    return Semantics(
      label: 'Payment option: $label${isSelected ? ", selected" : ""}',
      child: GestureDetector(
        onTap: () => setState(() => _selectedMethod = label),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDark ? kCardDark : kCardLight,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            border: Border.all(
              color: isSelected
                  ? (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                  : (isDark ? kSubtextDark.withOpacity(0.5) : kSubtextLight.withOpacity(0.5)),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                    : (isDark ? kSubtextDark : kSubtextLight),
                size: 26,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    color: isDark ? kTextDark : kTextLight,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}