import 'package:customertech/controller/notification_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 18,
            color: isDark ? kTextDark : kTextLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: getTextColor(isDark)),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Obx(
        () => controller.notifications.isEmpty
            ? Center(
                child: Text(
                  "No notifications available",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? kSubtextDark : kSubtextLight,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(kDefaultPadding),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  final notif = controller.notifications[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: NotificationCard(
                      icon: notif['icon'] as IconData,
                      iconColor: notif['iconColor'] as Color,
                      title: notif['title'] as String,
                      message: notif['message'] as String,
                      time: notif['time'] as String,
                      isRead: notif['isRead'] as bool,
                      onTap: () {
                        controller.markAsRead(index);
                        Get.snackbar(
                          notif['title'] as String,
                          notif['message'] as String,
                          backgroundColor: isDark ? kCardDark : kCardLight,
                          colorText: isDark ? kTextDark : kTextLight,
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label:
          'Notification: $title, $message, $time, ${isRead ? "read" : "unread"}',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isRead ? FontWeight.w500 : FontWeight.w600,
                        color: isDark ? kTextDark : kTextLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? kSubtextDark : kSubtextLight,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark
                            ? kSubtextDark.withOpacity(0.7)
                            : kSubtextLight.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isRead)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: isDark ? kAccentColorDark : kAccentColorLight,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
