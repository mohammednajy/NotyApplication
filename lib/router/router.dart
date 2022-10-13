import 'package:flutter/cupertino.dart';

class AppRouter {
  AppRouter._();
  static final navigatorKey = GlobalKey<NavigatorState>();

  static goToAndReplacment(String screenName) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  static goTo(String screenName) {
    navigatorKey.currentState!.pushNamed(screenName);
  }

  static back() {
    navigatorKey.currentState!.pop();
  }
}
