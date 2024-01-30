import 'package:ads/src/features/forget_password/create_new_password.dart';
import 'package:ads/src/features/forget_password/forget_password.dart';
import 'package:ads/src/features/screen/login_page.dart';
import 'package:ads/src/features/screen/opening_screen.dart';
import 'package:ads/src/features/screen/splash_screen.dart';
import 'package:ads/src/features/sign-up/sign_up.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: SplashScreen.routePath,
  routes: <RouteBase>[
    GoRoute(
      path: '/Splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/OpeningScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const OpeningScreen();
      },
    ),
    GoRoute(
      path: '/LoginPage',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/ForgotPassword',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotPassword();
      },
    ),
    GoRoute(
      path: '/CreateNewPassword',
      builder: (BuildContext context, GoRouterState state) {
        return const CreateNewPassword();
      },
    ),
    GoRoute(
      path: '/Signup',
      builder: (BuildContext context, GoRouterState state) {
        return const Signup();
      },
    ),
    GoRoute(
      path: '/HomePage',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    )
  ],
);
