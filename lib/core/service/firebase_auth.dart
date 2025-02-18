import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

const String firebaseApiKey = "AIzaSyCpiCKPEFz7WHmFPTXhCX2dFspMqtbNu3E";

Future<String> signUpWithEmail(String email, String password) async {
  final url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    }),
  );

  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return data['localId'];
  } else {
    log("❌ Error: ${data['error']['message']}");
    throw Exception("Failed to create teacher");
  }
}

Future<void> signInWithEmail(String email, String password) async {
  final url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    }),
  );

  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    print("✅ Signed in successfully!");
    print("ID Token: ${data['idToken']}");
  } else {
    print("❌ Error: ${data['error']['message']}");
  }
}

Future<void> refreshToken(String refreshToken) async {
  final url = Uri.parse(
      "https://securetoken.googleapis.com/v1/token?key=$firebaseApiKey");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "grant_type": "refresh_token",
      "refresh_token": refreshToken,
    }),
  );

  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    print("✅ Token refreshed successfully!");
    print("New ID Token: ${data['id_token']}");
  } else {
    print("❌ Error: ${data['error']['message']}");
  }
}
