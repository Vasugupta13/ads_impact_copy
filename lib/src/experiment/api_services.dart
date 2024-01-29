import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> signInWithGoogle() async {
    final response = await http.get(Uri.parse('$baseUrl/auth/google'));

    if (response.statusCode == 200) {
      // Successful response, parse the data
      return json.decode(response.body);
    } else {
      // Handle error
      throw Exception('Failed to sign in with Google');
    }
  }

  Future<Map<String, dynamic>> handleGoogleSignInCallback() async {
    final response = await http.get(Uri.parse('$baseUrl/auth/google/callback'));

    if (response.statusCode == 200) {
      // Successful response, parse the data
      return json.decode(response.body);
    } else {
      // Handle error
      throw Exception('Failed to handle Google Sign-In callback');
    }
  }

  // Add other API calls as needed
}
