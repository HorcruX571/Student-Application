// profile_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileService {
  final String baseUrl = "https://gradebook-backend-1d92.onrender.com/u/me";

  Future<Map<String, dynamic>> fetchProfile(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
