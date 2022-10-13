import 'package:flutter/material.dart';
import 'package:notey_app/data/controller/auth_controller.dart';
import 'package:notey_app/ui/shared/text_field_widget.dart';
import 'package:notey_app/utils/constant_utils.dart';
import 'package:notey_app/utils/extention.dart';

import 'package:provider/provider.dart';

import '../../../router/router.dart';
import '../../../router/routes_name.dart';
import '../../shared/bottom_ritch_text.dart';
import '../../shared/button_widget.dart';
import '../../shared/header_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey _logFormKey;
  bool _obscurPassword = true;

  @override
  void initState() {
    super.initState();
    _logFormKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(
        builder: (context, value, child) => Form(
          key: _logFormKey,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const HeaderText(firstText: 'Welcome ', secondText: 'Back'),
                addVerticalSpace(25),
                TextFormFiledWidget(
                    controller: _emailController,
                    icon: ImagePath.userIcon,
                    hintText: 'email',
                    validator: (value) {
                      return value?.isValidEmail;
                    }),
                addVerticalSpace(14),
                TextFormFiledWidget(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurPassword = !_obscurPassword;
                        });
                      },
                      icon: Icon(
                        _obscurPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.green,
                      )),
                  controller: _passwordController,
                  icon: ImagePath.passwrodIcon,
                  hintText: 'password',
                  validator: (value) {
                    return value?.isValidPassword;
                  },
                  obscureText: _obscurPassword,
                ),
                addVerticalSpace(20),
                ButtonWidget(
                    text: 'Login',
                    visible: value.isLoading,
                    onPressed: () => value.login(
                        logFormKey: _logFormKey,
                        email: _emailController.text,
                        password: _passwordController.text)),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      AppRouter.goTo(ScreenName.forgetPasswordScreen);
                    },
                    child: Text(
                      'Forget password?',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 15),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BottomRitchText(
                    leftText: 'Haven\'t an account? ',
                    rightText: 'Sign Up',
                    handlTap: () {
                      AppRouter.goToAndReplacment(ScreenName.singupScreen);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
