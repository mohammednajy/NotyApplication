import 'package:flutter/material.dart';
import 'package:notey_app/data/local_storage/shared_perferance.dart';
import 'package:notey_app/utils/constant_utils.dart';

import '../../../router/router.dart';
import '../../../router/routes_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => SharedPref().getLogedIn
            ? AppRouter.goToAndReplacment(ScreenName.homeScreen)
            : AppRouter.goToAndReplacment(ScreenName.loginScreen));
    return Scaffold(
      body: Center(
        child: Image.asset(ImagePath.splash),
      ),
    );
  }
}
