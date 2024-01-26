import 'package:ads/src/features/bottombar/account/account.dart';
import 'package:ads/src/features/bottombar/analysis.dart';
import 'package:ads/src/features/bottombar/cart.dart';
import 'package:ads/src/features/screen/splash_screen.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "spalsh",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        path: "/home",
        name: "home",
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: "/analysis",
        name: "home",
        pageBuilder: (context, state) {
          return const MaterialPage(child: AnalysisPage());
        },
      ),
      GoRoute(
        path: "/cart",
        name: "home",
        pageBuilder: (context, state) {
          return const MaterialPage(child: CartPage());
        },
      ),
      GoRoute(
        path: "/account",
        name: "home",
        pageBuilder: (context, state) {
          return const MaterialPage(child: MyAccountPage());
        },
      ),
    ],
  );
}
