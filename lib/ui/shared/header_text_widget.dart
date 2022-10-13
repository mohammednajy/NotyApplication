import 'package:flutter/material.dart';
import 'package:notey_app/ui/shared/gradinat_text.dart';

import '../../utils/constant_utils.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    required this.firstText,
    required this.secondText,
    Key? key,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.headline1,
        ),
        GradientText(
          secondText,
          style: const TextStyle(fontSize: 40),
          gradient: const LinearGradient(colors: [
            AppColors.blue,
            AppColors.green,
          ]),
        ),
      ],
    );
  }
}
