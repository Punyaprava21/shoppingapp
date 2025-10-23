import 'dart:convert';
import 'package:customertech/utility/token_helper.dart';
import 'package:http/http.dart' as http;
import 'package:customertech/utility/constant.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  // Optional: initialize the service if needed
  Future<ApiService> init() async {
    return this;
  }

  /// 🔹 Register user
  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String mobileNumber,
    required String password,
    required String role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'mobile_number': mobileNumber,
          'password': password,
          'role': role,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': data};
      }

      return {
        'success': false,
        'message': data['message'] ?? 'Registration failed',
        'statusCode': response.statusCode,
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 🔹 Login user
  Future<Map<String, dynamic>> loginUser({
    required String mobileNumber,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'mobile_number': mobileNumber,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          data['status'] == true &&
          data['token'] != null) {
        // ✅ Save token using TokenHelper
        await TokenHelper.to.saveToken(data['token']);

        return {'success': true, 'data': data};
      }

      return {
        'success': false,
        'message': data['message'] ?? _getErrorMessage(response.statusCode),
        'statusCode': response.statusCode,
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 🔹 Get friendly error message
  String _getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Invalid credentials';
      case 403:
        return 'Access forbidden';
      case 500:
        return 'Server error';
      default:
        return 'Something went wrong';
    }
  }
}
