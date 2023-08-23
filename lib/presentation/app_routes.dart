import 'package:flutter/material.dart';
import 'package:medium_project/presentation/splash/splash_screen.dart';
import 'package:medium_project/presentation/tab_box/tab_box.dart';
import '../data/models/user/user_model.dart';
import 'auth/gmail_confirm/gmail_confirm_screen.dart';
import 'auth/page/login_screen.dart';
import 'auth/page/register_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String loginScreen = "/auth_screen";
  static const String registerScreen = "/register_screen";
  static const String tabBox = "/tab_box";
  static const String confirmGmail = "/confirm_gmail";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        });

      case RouteNames.registerScreen:
        return MaterialPageRoute(builder: (context) {
          return const RegisterScreen();
        });

      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBox());

      case RouteNames.confirmGmail:
        return MaterialPageRoute(
          builder: (context) => GmailConfirmScreen(
            userModel: settings.arguments as UserModel,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found"),
            ),
          ),
        );
    }
  }
}
