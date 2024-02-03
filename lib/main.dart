import 'package:ads/src/features/bottombar/account/account.dart';
import 'package:ads/src/features/bottombar/analysis.dart';
import 'package:ads/src/features/bottombar/cart.dart';
import 'package:ads/src/features/connect_account/connect_your_account_pg2.dart';
import 'package:ads/src/features/screen/login_page.dart';
import 'package:ads/src/features/screen/splash_screen.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/utils/const.dart';
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
          scaffoldBackgroundColor: kwhite,
          fontFamily:
              GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontWeight: FontWeight.w500))),
      defaultTransition: Transition.leftToRightWithFade,
      // initialRoute:
      //     // '/home',
      //     // '/splash',
      //     '/',
      // getPages: [
      //   // GetPage(name: '/splash', page: () => const SplashScreen()),
      //   GetPage(name: '/home', page: () => const HomePage()),
      //   GetPage(name: '/analysis', page: () => const AnalysisPage()),
      //   GetPage(name: '/cart', page: () => const CartPage()),
      //   GetPage(name: '/account', page: () => const MyAccountPage())
      // ],
      home:  HomePage(),
      // const SplashScreen(),
    );
  }
}
