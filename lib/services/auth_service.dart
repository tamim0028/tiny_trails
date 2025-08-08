import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiEndpoints {
  static const String baseUrl = 'https://tinytrails.alaminse.online/api';
  static const String login = '/login';
}

class AuthService {
  Future<String?> getCurrentUser() async {
    return null;
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Store the token in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        return data;
      } else {
        // Handle error
        print('Login failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final response = await http.post(
        Uri.parse(ApiEndpoints.baseUrl + '/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Clear the token from shared preferences
        await prefs.remove('token');
        return true;
      } else {
        print('Logout failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error during logout: $e');
      return false;
    }
  }
}
