import 'package:flutter/material.dart';
import 'package:notey_app/data/controller/auth_controller.dart';
import 'package:notey_app/router/router.dart';
import 'package:notey_app/router/routes_name.dart';
import 'package:notey_app/ui/shared/bottom_ritch_text.dart';
import 'package:notey_app/ui/shared/button_widget.dart';
import 'package:notey_app/ui/shared/header_text_widget.dart';
import 'package:notey_app/ui/shared/text_field_widget.dart';
import 'package:notey_app/utils/constant_utils.dart';
import 'package:provider/provider.dart';
import 'package:notey_app/utils/extention.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  String? _gender = "M";
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey _singFormKey;
  @override
  void initState() {
    super.initState();
    _singFormKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _singFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(80),
                const HeaderText(firstText: 'Sign ', secondText: 'Up'),
                addVerticalSpace(10),
                Text(
                  'Create a new account!',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 24),
                ),
                addVerticalSpace(30),
                Expanded(
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        TextFormFiledWidget(
                            controller: _fullNameController,
                            icon: ImagePath.userIcon,
                            hintText: 'Full name ',
                            validator: (value) {
                              return value?.isValidName;
                            }),
                        addVerticalSpace(12),
                        TextFormFiledWidget(
                            controller: _emailController,
                            icon: ImagePath.emailIcon,
                            hintText: 'email',
                            validator: (value) {
                              return value?.isValidEmail;
                            }),
                        addVerticalSpace(12),
                        TextFormFiledWidget(
                            controller: _passwordController,
                            icon: ImagePath.passwrodIcon,
                            hintText: 'password',
                            validator: (value) {
                              return value?.isValidPassword;
                            }),
                        addVerticalSpace(12),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 65, 63, 63),
                                    borderRadius: BorderRadius.circular(10)),
                                child: RadioListTile<String>(
                                    title: Text('Male',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                    value: "M",
                                    groupValue: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    }),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 65, 63, 63),
                                    borderRadius: BorderRadius.circular(10)),
                                child: RadioListTile<String>(
                                    title: Text('Femal',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                    value: "F",
                                    groupValue: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(40),
                        ButtonWidget(
                            text: 'Sing Up',
                            visible: value.isLoading,
                            onPressed: () {
                              value.singUp(
                                  singFormKey: _singFormKey,
                                  fullName: _fullNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  gender: _gender!);
                            }),
                        addVerticalSpace(90),
                        BottomRitchText(
                          leftText: 'Have an account',
                          rightText: ' Sign In ',
                          handlTap: () {
                            AppRouter.goToAndReplacment(ScreenName.loginScreen);
                          },
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
