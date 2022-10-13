import 'package:flutter/material.dart';

import '../../utils/constant_utils.dart';

class TextFormFiledWidget extends StatelessWidget {
  const TextFormFiledWidget(
      {this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      required this.icon,
      required this.hintText,
      required this.validator,
      this.keyboardType = TextInputType.text,
      super.key});
  final String icon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      cursorColor: AppColors.green,
      obscureText: obscureText,
      // onFieldSubmitted: onFieldSubmitted,
      // textInputAction: textInputAction,
      style:
          Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: Image.asset(
          icon,
          color: AppColors.green,
          fit: BoxFit.scaleDown,
        ),
        filled: true,
        // errorStyle: const TextStyle(height: 0, color: Colors.transparent),
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.gray,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          
        fillColor: AppColors.graydark,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.transparent, width: 3),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColors.green),
        ),
      ),
    );
  }
}
