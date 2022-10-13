import 'package:flutter/material.dart';

import '../../utils/constant_utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {required this.text,
      required this.visible,
      required this.onPressed,
      super.key});

  final String text;
  final bool visible;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 47,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading...',
              style: Theme.of(context).textTheme.headline6,
            ),
            const CircularProgressIndicator(
              strokeWidth: 4,
              color: AppColors.green,
            )
          ],
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                AppColors.blue,
                AppColors.green,
              ])),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 22),
            ),
          )),
    );
  }
}
