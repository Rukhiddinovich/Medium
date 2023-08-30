import 'package:flutter/material.dart';
import 'package:medium_project/data/models/website/website_model.dart';
import 'package:medium_project/presentation/splash/splash_screen.dart';
import 'package:medium_project/presentation/tab_box/articles/widgets/article_detail_screen.dart';
import 'package:medium_project/presentation/tab_box/tab_box.dart';
import 'package:medium_project/presentation/tab_box/website/widgets/website_add_screen.dart';
import 'package:medium_project/presentation/tab_box/website/widgets/website_detail_screen.dart';
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
  static const String websiteDetail = "/website_detail";
  static const String websiteAdd = "/website_add";
  static const String articleDetail = "/article_detail";
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

      case RouteNames.websiteAdd:
        return MaterialPageRoute(builder: (context) {
          return const WebsiteAddScreen();
        });
      case RouteNames.articleDetail:
        return MaterialPageRoute(builder: (context) {
          return const ArticleDetailScreen();
        });
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBox());

      case RouteNames.confirmGmail:
        return MaterialPageRoute(
          builder: (context) => GmailConfirmScreen(
            userModel: settings.arguments as UserModel,
          ),
        );
      case RouteNames.websiteDetail:
        return MaterialPageRoute(builder: (context) {
          return WebsiteDetailScreen(websiteModel: settings.arguments as WebsiteModel);
        });

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
