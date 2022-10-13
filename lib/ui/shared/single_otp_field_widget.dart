import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constant_utils.dart';


class SingleOtpField extends StatelessWidget {
  const SingleOtpField(
      {required this.focusNode,
      required this.textControllerField,
      required this.onChanged,
      super.key});

  final FocusNode focusNode;
  final TextEditingController textControllerField;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        focusNode: focusNode,
        controller: textControllerField,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            hintText: "-",
            hintStyle: const TextStyle(fontSize: 30),
            counter: Container(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: AppColors.graydark,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.green,
                ))),
      ),
    );
  }
}
