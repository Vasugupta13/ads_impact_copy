// import 'dart:convert';
// import 'dart:io'; // Import Dart's IO library for SocketException
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   static var client = http.Client();

//   static Future<String?> postData({required String apiUrl, required dynamic payload}) async {
//     Map<String, String> headers = {"Content-type": "application/json"};

//     try {
//       final response = await client.post(Uri.parse(apiUrl), body: json.encode(payload), headers: headers);

//       if (kDebugMode) {
//         debugPrint("apiUrl ::::=> $apiUrl");
//         debugPrint("$apiUrl ::::=> payload ${json.encode(payload)}");
//         debugPrint("$apiUrl ::::=> statusCode ${response.statusCode}");
//         debugPrint("$apiUrl ::::=> body ${response.body}");
//       }

//       if (response.statusCode == 200 || response.statusCode == 408) {
//         return response.body;
//       } else if (response.statusCode == 502) {
//         var data = json.decode(response.body);
//         if (kDebugMode) {
//           print("Error postData StatusCode ::=> ${response.statusCode}, errorMessage ::=> ${data['message']}");
//         }
//         return response.body;
//       } else {
//         var data = json.decode(response.body);
//         if (kDebugMode) {
//           print("Error postData StatusCode ::=> ${response.statusCode}, errorMessage ::=> ${data['message']}");
//         }
//         return response.body;
//       }
//     } on SocketException catch (e) {
//       // Handle SocketException separately (connection refused)
//       if (kDebugMode) {
//         print("SocketException in postData: $e");
//       }
//       return null;
//     } catch (e, stackTrace) {
//       if (kDebugMode) {
//         print("Error in postData $apiUrl $e $stackTrace");
//       }
//       return null;
//     }
//   }

//   static Future<String?> fetchData({required String apiUrl}) async {
//     Map<String, String> headers = {'Content-type': 'application/json'};

//     if (kDebugMode) {
//       print("apiUrl ::::=> $apiUrl");
//     }

//     try {
//       final response = await client.get(Uri.parse(apiUrl), headers: headers);
//       var data = json.decode(response.body);

//       if (response.statusCode == 200 || response.statusCode == 408) {
//         return response.body.toString();
//       } else if (response.statusCode == 502) {
//         if (kDebugMode) {
//           print("Error postData StatusCode ::=> ${response.statusCode}, errorMessage ::=> ${data['message']}");
//         }
//         return response.body.toString();
//       } else {
//         return response.body.toString();
//       }
//     } catch (e, stackTrace) {
//       if (kDebugMode) {
//         print("Error in fetchData $apiUrl $e $stackTrace");
//       }
//       return null;
//     }
//   }
// }
