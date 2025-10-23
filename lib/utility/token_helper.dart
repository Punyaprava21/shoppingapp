import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper extends GetxController {
  // Singleton instance
  static TokenHelper get to => Get.find();

  final _token = ''.obs;
  static const String _tokenKey = 'auth_token';

  @override
  void onInit() {
    super.onInit();
    _loadToken(); // Load token from storage on init
  }

  /// Load token from shared preferences
  Future<void> _loadToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey) ?? '';
      _token.value = token;
      print('Loaded token: $token');
    } catch (e) {
      print('Error loading token: $e');
    }
  }

  /// Save token to shared preferences and update in-memory
  Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
      _token.value = token;
      print('Saved token: $token');
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  /// Get token
  String get token => _token.value;

  /// Check if token exists
  bool get hasToken => _token.value.isNotEmpty;

  /// Remove token (logout)
  Future<void> removeToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      _token.value = '';
      print('Token removed');
    } catch (e) {
      print('Error removing token: $e');
    }
  }
}
