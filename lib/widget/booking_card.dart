import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String bookingId;
  final String serviceName;
  final String technicianName;
  final String date;
  final String status;
  final Color statusColor;
  final IconData icon;
  final String amount;
  final bool isDark;
  final VoidCallback onTap;

  const BookingCard({
    super.key,
    required this.bookingId,
    required this.serviceName,
    required this.technicianName,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.icon,
    required this.amount,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: width * 0.015,
          horizontal: width * 0.03,
        ),
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          color: isDark ? kCardDark : kCardLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDark
                ? kSubtextDark.withOpacity(0.4)
                : kSubtextLight.withOpacity(0.4),
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left icon
            Container(
              height: width * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: statusColor, size: width * 0.05),
            ),
            SizedBox(width: width * 0.03),

            // Right side content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service name + status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          serviceName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: width * 0.038,
                            fontWeight: FontWeight.w600,
                            color: isDark ? kTextDark : kTextLight,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: width * 0.007,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                            color: statusColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width * 0.008),

                  // Technician
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: width * 0.035,
                        color: isDark ? kSubtextDark : kSubtextLight,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          technicianName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: width * 0.032,
                            color: isDark ? kSubtextDark : kSubtextLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width * 0.005),

                  // Date + Amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: width * 0.035,
                            color: isDark ? kSubtextDark : kSubtextLight,
                          ),
                          SizedBox(width: 4),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: width * 0.032,
                              color: isDark ? kSubtextDark : kSubtextLight,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        amount,
                        style: TextStyle(
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? kPrimaryColorDark
                              : kPrimaryColorLight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width * 0.004),

                  // Booking ID
                  Text(
                    bookingId,
                    style: TextStyle(
                      fontSize: width * 0.028,
                      color: isDark ? kSubtextDark : kSubtextLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
