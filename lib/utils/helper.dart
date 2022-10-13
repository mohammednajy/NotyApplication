import 'package:flutter/material.dart';

import '../router/router.dart';

class MessageHelper {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      elevation: 0,
      backgroundColor:
          status ? Colors.green : const Color.fromARGB(255, 255, 17, 0),
    ));
    return true;
  }

  static Future<bool?> showAlertDialog() async {
    bool? result = await showDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (ctx) {
          return AlertDialog(
            content: const Text('Are you sure?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('No')),
            ],
          );
        });
    return result;
  }
}
