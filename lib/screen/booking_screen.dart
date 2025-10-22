import 'package:customertech/controller/booking_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/booking_card.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingsController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
        appBar: AppBar(
          backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
          title: Text(
            'My Bookings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
              letterSpacing: 0.3,
            ),
          ),

          elevation: 0,
          automaticallyImplyLeading: false,

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? kCardDark : kCardLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                indicatorColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                indicatorWeight: 3,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelColor: isDark ? kTextDark : kTextLight,
                unselectedLabelColor: isDark ? kSubtextDark : kSubtextLight,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: 'Active'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
          ),
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: controller.fetchBookings,
            color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
            child: TabBarView(
              children: [
                _buildBookingList(context, controller.activeBookings, isDark),
                _buildBookingList(
                  context,
                  controller.completedBookings,
                  isDark,
                ),
                _buildCancelledBookings(context, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingList(
    BuildContext context,
    List<Map<String, dynamic>> bookings,
    bool isDark,
  ) {
    return bookings.isEmpty
        ? Center(
            child: Text(
              'No bookings available',
              style: TextStyle(
                fontSize: 16,
                color: isDark ? kSubtextDark : kSubtextLight,
              ),
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(kDefaultPadding),
            itemCount: bookings.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: kDefaultPadding),
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return BookingCard(
                bookingId: booking['bookingId'],
                serviceName: booking['serviceName'],
                technicianName: booking['technicianName'],
                date: booking['date'],
                status: booking['status'],
                statusColor: booking['statusColor'],
                icon: booking['icon'],
                amount: booking['amount'],
                isDark: isDark,
                onTap: () {
                  Get.toNamed('/booking-details', arguments: booking);
                },
              );
            },
          );
  }

  Widget _buildCancelledBookings(BuildContext context, bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Semantics(
              label: 'No cancelled bookings',
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      isDark ? kAccentColorDark : kAccentColorLight,
                      isDark
                          ? kAccentColorDark.withOpacity(0.7)
                          : kAccentColorLight.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  Icons.cancel_outlined,
                  size: 34,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No Cancelled Bookings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? kTextDark : kTextLight,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You haven\'t cancelled any bookings yet',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? kSubtextDark : kSubtextLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
