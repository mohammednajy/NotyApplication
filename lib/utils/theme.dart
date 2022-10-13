import 'package:flutter/material.dart';
import 'package:notey_app/utils/constant_utils.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      headline2: TextStyle(
          color: AppColors.gray, fontSize: 20, fontWeight: FontWeight.w400)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all<double?>(0),
        minimumSize:
            MaterialStateProperty.all<Size?>(const Size(double.infinity, 44)),
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.transparent)),
  ),
);
