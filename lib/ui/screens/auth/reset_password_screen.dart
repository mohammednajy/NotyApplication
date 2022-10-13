import 'package:flutter/material.dart';
import 'package:notey_app/router/router.dart';
import 'package:notey_app/ui/shared/button_widget.dart';
import 'package:notey_app/ui/shared/text_field_widget.dart';
import 'package:notey_app/utils/constant_utils.dart';
import 'package:notey_app/utils/extention.dart';
import 'package:provider/provider.dart';

import '../../../data/controller/auth_controller.dart';
import '../../shared/otp_code_widget.dart';

class ResetPassowrdScreen extends StatefulWidget {
  const ResetPassowrdScreen({required this.code, super.key});
  final String code;

  @override
  State<ResetPassowrdScreen> createState() => _ResetPassowrdScreenState();
}

class _ResetPassowrdScreenState extends State<ResetPassowrdScreen> {
  final GlobalKey<FormState> _resetPasswordKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late final TextEditingController _firstControllerField;
  late final TextEditingController _secoundControllerField;
  late final TextEditingController _thirdControllerField;
  late final TextEditingController _fourthControllerField;
  @override
  void initState() {
    super.initState();
    _firstControllerField = TextEditingController();
    _secoundControllerField = TextEditingController();
    _thirdControllerField = TextEditingController();
    _fourthControllerField = TextEditingController();
    _showCode();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstControllerField.dispose();
    _secoundControllerField.dispose();
    _thirdControllerField.dispose();
    _fourthControllerField.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(widget.code);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          onPressed: () {
            AppRouter.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _resetPasswordKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(50),
                Text(
                  'Create new password',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 30, color: AppColors.white),
                ),
                addVerticalSpace(10),
                Text(
                  'Your new password must be different from previous used passwords.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 15),
                ),
                addVerticalSpace(30),
                TextFormFiledWidget(
                    controller: _emailController,
                    icon: ImagePath.emailIcon,
                    hintText: 'email',
                    validator: (value) {
                      return value?.isValidEmail;
                    }),
                addVerticalSpace(10),
                OTPCodeWidget(
                  firstControllerField: _firstControllerField,
                  secoundControllerField: _secoundControllerField,
                  thirdControllerField: _thirdControllerField,
                  fourthControllerField: _fourthControllerField,
                ),
                addVerticalSpace(5),
                TextFormFiledWidget(
                  controller: _passwordController,
                  icon: ImagePath.passwrodIcon,
                  hintText: 'password',
                  validator: (value) {
                    return value?.isValidPassword;
                  },
                ),
                addVerticalSpace(10),
                TextFormFiledWidget(
                  icon: ImagePath.passwrodIcon,
                  hintText: 'confirm password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter required data';
                    }
                    if (value != _passwordController.text) {
                      return 'not math';
                    }

                    return null;
                  },
                ),
                addVerticalSpace(30),
                ButtonWidget(
                    text: 'Confirm',
                    visible: context.watch<AuthController>().isLoading,
                    onPressed: () {
                      String code = _firstControllerField.text +
                          _secoundControllerField.text +
                          _thirdControllerField.text +
                          _fourthControllerField.text;
                      context.read<AuthController>().resetPassowrd(
                          email: _emailController.text,
                          code: code,
                          password: _passwordController.text,
                          resetKey: _resetPasswordKey);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCode() {
    _firstControllerField.text = widget.code[0];
    _secoundControllerField.text = widget.code[1];
    _thirdControllerField.text = widget.code[2];
    _fourthControllerField.text = widget.code[3];
  }
}



