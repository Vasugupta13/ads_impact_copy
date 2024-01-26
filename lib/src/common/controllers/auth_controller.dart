// import 'dart:convert';
// import 'package:ads/services/services.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// final AuthController authController = Get.put(AuthController());

// class AuthController extends GetxController {
// //API call fn
//   loginUser() async {
//     var payload = {"email": "godambeaniket07@gmail.com", "password": "ABCDGHI"};
//     try {
//       var response = await ApiServices.postData(
//           apiUrl: "http://localhost:4000/auth/login", payload: payload);
//       // var jsonMap = json.decode(response);

//       // if ( ) {
//       return true;
//       // }
//       // else {
//       //   return false;
//       // }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Errror is getInfluencerList $e");
//       }
//       return false;
//     }
//   }
// }
