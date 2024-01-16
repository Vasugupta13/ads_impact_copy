import 'package:ads/src/experiment/demo.dart';
import 'package:ads/src/features/connect_account/connect_dashboard.dart';
import 'package:ads/src/features/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily:
              GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily),
      home: const SplashScreen(),
    );
  }
}
