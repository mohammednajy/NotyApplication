import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constant_utils.dart';

class BottomRitchText extends StatefulWidget {
  const BottomRitchText(
      {required this.leftText,
      required this.rightText,
      required this.handlTap,
      super.key});

  final VoidCallback handlTap;
  final String leftText;
  final String rightText;

  @override
  State<BottomRitchText> createState() => _BottomRitchTextState();
}

class _BottomRitchTextState extends State<BottomRitchText> {
  late TapGestureRecognizer _pressRecognizer;
  @override
  void initState() {
    super.initState();
    _pressRecognizer = TapGestureRecognizer()..onTap = widget.handlTap;
  }

  @override
  void dispose() {
    _pressRecognizer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                  text: widget.rightText,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 16,
                      color: AppColors.green,
                      decoration: TextDecoration.underline),
                  recognizer: _pressRecognizer)
            ],
            text: widget.leftText,
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16)));
  }
}
