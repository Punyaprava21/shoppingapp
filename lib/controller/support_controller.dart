import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final expandedIndex = (-1).obs;

  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I book a service?',
      'answer':
          'You can book a service by browsing our services, selecting the one you need, choosing your preferred time slot, and confirming your booking. Our technician will arrive at your doorstep at the scheduled time.',
    },
    {
      'question': 'What are your service charges?',
      'answer':
          'Service charges vary depending on the type of service. You can view the estimated price before booking. Final charges may vary based on the actual work required.',
    },
    {
      'question': 'Can I cancel or reschedule my booking?',
      'answer':
          'Yes, you can cancel or reschedule your booking up to 2 hours before the scheduled time without any charges. Go to the Bookings tab and select the booking you want to modify.',
    },
    {
      'question': 'Are your technicians verified?',
      'answer':
          'Yes, all our technicians are thoroughly verified, trained, and experienced professionals. We ensure quality service and customer satisfaction.',
    },
    {
      'question': 'What payment methods do you accept?',
      'answer':
          'We accept all major payment methods including credit/debit cards, UPI, net banking, and cash on delivery. You can choose your preferred payment method at checkout.',
    },
    {
      'question': 'Do you provide warranty on services?',
      'answer':
          'Yes, we provide a 30-day warranty on all our services. If you face any issues within this period, we will fix it free of charge.',
    },
  ];

  void toggleFAQ(int index) {
    expandedIndex.value = index;
  }

  void submitMessage() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
      return;
    }

    // Simulate sending message
    Get.snackbar(
      'Success',
      'Your message has been sent. We\'ll get back to you soon!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
    );

    // Clear form
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  void openChat() {
    Get.snackbar(
      'Chat Support',
      'Opening chat with our support team...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
    // Here you would integrate with your chat system
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
