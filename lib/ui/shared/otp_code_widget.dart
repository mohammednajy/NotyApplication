import 'package:flutter/material.dart';
import 'package:notey_app/ui/shared/single_otp_field_widget.dart';

import '../../utils/constant_utils.dart';

class OTPCodeWidget extends StatefulWidget {
  const OTPCodeWidget({
    required this.firstControllerField,
    required this.secoundControllerField,
    required this.thirdControllerField,
    required this.fourthControllerField,
    Key? key,
  }) : super(key: key);
  final TextEditingController firstControllerField;
  final TextEditingController secoundControllerField;
  final TextEditingController thirdControllerField;
  final TextEditingController fourthControllerField;

  @override
  State<OTPCodeWidget> createState() => _OTPCodeWidgetState();
}

class _OTPCodeWidgetState extends State<OTPCodeWidget> {
  late final FocusNode _firstField;
  late final FocusNode _secoundField;
  late final FocusNode _thirdField;
  late final FocusNode _fourthField;

  @override
  void initState() {
    super.initState();

    _firstField = FocusNode();
    _secoundField = FocusNode();
    _thirdField = FocusNode();
    _fourthField = FocusNode();
  }

  @override
  void dispose() {
    _firstField.dispose();
    _secoundField.dispose();
    _thirdField.dispose();
    _fourthField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleOtpField(
            focusNode: _firstField,
            textControllerField: widget.firstControllerField,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _firstField.nextFocus();
              }
            }),
        addHorizantalSpace(7),
        SingleOtpField(
            focusNode: _secoundField,
            textControllerField: widget.secoundControllerField,
            onChanged: (value) {
              widget.secoundControllerField.text.isNotEmpty
                  ? _secoundField.nextFocus()
                  : _secoundField.previousFocus();
            }),
        addHorizantalSpace(7),
        SingleOtpField(
            focusNode: _thirdField,
            textControllerField: widget.thirdControllerField,
            onChanged: (value) {
              widget.thirdControllerField.text.isNotEmpty
                  ? _thirdField.nextFocus()
                  : _thirdField.previousFocus();
            }),
        addHorizantalSpace(7),
        SingleOtpField(
            focusNode: _fourthField,
            textControllerField: widget.fourthControllerField,
            onChanged: (value) {
              if (widget.fourthControllerField.text.isEmpty) {
                _fourthField.previousFocus();
              }
            }),
      ],
    );
  }
}
