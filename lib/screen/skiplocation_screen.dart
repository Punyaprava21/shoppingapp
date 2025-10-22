import 'package:customertech/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipLocationScreen extends StatelessWidget {
  const SkipLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.put(LocationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F3FF),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Color(0xFF7C4DFF),
                            strokeWidth: 3,
                          )
                        : const Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFF7C4DFF),
                            size: 60,
                          ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    controller.locationText.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 20),
                if (!controller.isLoading.value &&
                    (controller.locationText.value.contains('Failed') ||
                        controller.locationText.value.contains('Error')))
                  ElevatedButton(
                    onPressed: controller.retryFetch,
                    child: const Text('Retry'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}