import 'package:flutter/material.dart';
import 'package:notey_app/data/controller/auth_controller.dart';
import 'package:notey_app/data/controller/task_controller.dart';
import 'package:notey_app/data/local_storage/shared_perferance.dart';
import 'package:notey_app/router/router.dart';
import 'package:notey_app/router/routes_name.dart';
import 'package:notey_app/utils/helper.dart';

import 'package:notey_app/utils/theme.dart';
import 'package:provider/provider.dart';

import 'router/route_genarator.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskController(),
        )
      ],
      child: const NoteyApp(),
    ),
  );
}

class NoteyApp extends StatelessWidget {
  const NoteyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navigatorKey,
      scaffoldMessengerKey: MessageHelper.scaffoldKey,
      debugShowCheckedModeBanner: false,
      initialRoute: ScreenName.splashScreen,
      onGenerateRoute: RouteGenarator.generateRoute,
      theme: darkTheme,
    );
  }
}
