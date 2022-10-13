import 'package:flutter/material.dart';
import 'package:notey_app/router/routes_name.dart';
import 'package:notey_app/ui/screens/auth/forget_password_screen.dart';
import 'package:notey_app/ui/screens/auth/login_screen.dart';
import 'package:notey_app/ui/screens/auth/singup_screen.dart';
import 'package:notey_app/ui/screens/home/home_screen.dart';
import 'package:notey_app/ui/screens/splash/splash_screen.dart';
class RouteGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case ScreenName.splashScreen:
        page = const SplashScreen();
        break;
      case ScreenName.loginScreen:
        page = const LoginScreen();
        break;
      case ScreenName.homeScreen:
        page =   const HomeScreen();
        break;
      case ScreenName.singupScreen:
        page = const SingupScreen();
        break;

      case ScreenName.forgetPasswordScreen:
        page =  ForgetPasswordScreen();
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('wrong path '),
            ),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
