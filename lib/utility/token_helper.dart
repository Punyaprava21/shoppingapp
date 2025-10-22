import 'package:get/get.dart';

class TokenHelper extends GetxController {
  static TokenHelper get to => Get.find();

  final _token = ''.obs;

  /// Save token in memory
  void saveToken(String token) {
    _token.value = token;
  }

  /// Get token
  String get token => _token.value;

  /// Check if token exists
  bool get hasToken => _token.isNotEmpty;

  /// Remove token (logout)
  void removeToken() {
    _token.value = '';
  }
}
