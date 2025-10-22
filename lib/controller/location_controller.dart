import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  final RxString locationText = "Fetching your location...".obs;
  final RxBool isLoading = true.obs;
  int retryCount = 3;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 500), _fetchLocation);
  }

  Future<void> _fetchLocation() async {
    if (!isLoading.value) return;

    try {
      if (retryCount == 3) await Future.delayed(const Duration(seconds: 1));

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationText.value = "Location services are disabled. Proceeding without location.";
        isLoading.value = false;
        _navigateToHome();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationText.value = "Location permission denied. Proceeding without location.";
          isLoading.value = false;
          _navigateToHome();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationText.value = "Location permissions are permanently denied. Proceeding without location.";
        isLoading.value = false;
        _navigateToHome();
        return;
      }

      Position? lastPosition = await Geolocator.getLastKnownPosition();
      if (lastPosition != null) {
        locationText.value = "Using last known location:\nLat: ${lastPosition.latitude}, Long: ${lastPosition.longitude}";
        isLoading.value = false;
        _navigateToHome();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: const Duration(seconds: 10),
        forceAndroidLocationManager: true,
      );
      locationText.value = "Location fetched:\nLat: ${position.latitude}, Long: ${position.longitude}";
      isLoading.value = false;
      _navigateToHome();
    } catch (e) {
      print('Location fetch error: $e');
      if (retryCount > 0) {
        retryCount--;
        await Future.delayed(const Duration(seconds: 2));
        _fetchLocation();
      } else {
        locationText.value = "Failed to fetch location: ${e.toString()}. Proceeding without location.";
        isLoading.value = false;
        _navigateToHome();
      }
    }
  }

  void _navigateToHome() {
    Get.offNamed('/main');
  }

  void retryFetch() {
    if (!isLoading.value) {
      isLoading.value = true;
      locationText.value = "Fetching your location...";
      _fetchLocation();
    }
  }
}