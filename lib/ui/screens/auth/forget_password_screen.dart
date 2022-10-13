import 'package:flutter/material.dart';
import 'package:notey_app/data/controller/auth_controller.dart';
import 'package:notey_app/router/router.dart';
import 'package:notey_app/ui/shared/button_widget.dart';
import 'package:notey_app/ui/shared/text_field_widget.dart';
import 'package:notey_app/utils/constant_utils.dart';
import 'package:notey_app/utils/extention.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final GlobalKey<FormState> forgetkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
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
          color: AppColors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(100),
            Text(
              'Forget password',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 30, color: AppColors.white),
            ),
            addVerticalSpace(10),
            Text(
              'Enter the email associated with your account and we’ll send an email with instructions to reset your password!',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15),
            ),
            addVerticalSpace(15),
            Form(
              key: forgetkey,
              child: TextFormFiledWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  icon: ImagePath.emailIcon,
                  hintText: 'email',
                  validator: (value) {
                    return value?.isValidEmail;
                  }),
            ),
            addVerticalSpace(30),
            ButtonWidget(
                text: 'send',
                visible: context.watch<AuthController>().isLoading,
                onPressed: () {
                  context.read<AuthController>().forgetPassword(
                      email: _emailController.text, forgetkey: forgetkey);
                }),
          ],
        ),
      ),
    );
  }
}
