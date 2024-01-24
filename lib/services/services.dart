//Using gets state management

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//common API service class
class ApiServices {

  static var client = http.Client();

  //Post API call
  static postData({required String apiUrl, required var payload}) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    try {
      final response = await client.post(Uri.parse(apiUrl),
          body: json.encode(payload), headers: headers);
      if (kDebugMode) {
        debugPrint("apiUrl ::::=> $apiUrl");
        debugPrint("$apiUrl ::::=> payload ${json.encode(payload)}");
        debugPrint("$apiUrl ::::=> statusCode ${response.statusCode}");
        debugPrint("$apiUrl ::::=> body ${response.body}");
      }

      if (response.statusCode == 200) {
        return response.body;
      }
      if (response.statusCode == 408) {
        return response.body;
      }
      if (response.statusCode == 502) {
        var data = json.decode(response.body);
        if (kDebugMode) {
          print(
              "Error postData StatusCode ::=> ${response.statusCode}, errorMessage ::=> ${data['message']}");
        }
        return response.body;
      } else {
        var data = json.decode(response.body);
        if (kDebugMode) {
          print(
              "Error postData StatusCode ::=> ${response.statusCode}, errorMessage ::=> ${data['message']}");
        }
        return response.body;
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("error in $apiUrl $e $stackTrace");
      }
      return false;
    }
  }

//get API call
  static fetchData({required String apiUrl}) async {
    Map<String, String> headers = {'Content-type': 'application/json'};
    if (kDebugMode) {
      print("apiUrl ::::=> $apiUrl");
    }

    try {
      final response = await client.get(Uri.parse(apiUrl), headers: headers);
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        return response.body.toString();
      }
      if (response.statusCode == 408) {
        if (kDebugMode) {
          print(
              "Error postData StatusCode ::=> ${response.statusCode}, errorMessage ::=> ${data['message']}");
        }
        return response.body.toString();
      } else {
        return response.body.toString();
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("error in $apiUrl $e $stackTrace");
      }
      return false;
    }
  }
}
