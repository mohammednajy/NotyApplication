import 'package:flutter/material.dart';
import 'package:notey_app/data/controller/base_controller.dart';
import 'package:notey_app/data/controller/task_controller.dart';
import 'package:notey_app/data/local_storage/shared_perferance.dart';
import 'package:notey_app/data/network/api/auth_api.dart';
import 'package:provider/provider.dart';

import '../../router/router.dart';
import '../../router/routes_name.dart';
import '../../ui/screens/auth/reset_password_screen.dart';
import '../../utils/helper.dart';
import '../models/person_model.dart';
import '../models/response_model.dart';

class AuthController with ChangeNotifier, BaseController {
  bool isLoading = true;

  void login(
      {required String email,
      required String password,
      required var logFormKey}) async {
    if (logFormKey.currentState!.validate()) {
      isLoading = false;
      notifyListeners();
      try {
        var response = await AuthApi().login(email: email, password: password);
        PersonModel personObject = PersonModel.fromJson(response["object"]);
        await SharedPref().save(
            loged: true,
            token: personObject.token,
            email: personObject.email,
            name: personObject.fullName);
        if (response["status"] == true) {
          MessageHelper.showSnackBarMessage(
              message: response["message"], status: response["status"]);
          AppRouter.goToAndReplacment(ScreenName.homeScreen);
        }
      } catch (error) {
        handleError(error);
      }
      isLoading = true;
      notifyListeners();
    }
  }

  void logOut() async {
    bool? value = await MessageHelper.showAlertDialog();
    try {
      if (value != null && value) {
        ResponseModel response =
            ResponseModel.fromJson(await AuthApi().logOut());

        if (response.status) {
          await SharedPref().logedOut();
          MessageHelper.showSnackBarMessage(
              message: response.message, status: response.status);
          Provider.of<TaskController>(AppRouter.navigatorKey.currentContext!,
                  listen: false)
              .clear();
          AppRouter.goToAndReplacment(ScreenName.loginScreen);
        }
      }
    } catch (error) {
      handleError(error);
    }
  }

  void singUp({
    required String fullName,
    required String email,
    required String password,
    required String gender,
    required var singFormKey,
  }) async {
    if (singFormKey.currentState!.validate()) {
      isLoading = false;
      notifyListeners();
      try {
        var response = await AuthApi().singUp(
            fullName: fullName,
            email: email,
            password: password,
            gender: gender);
        ResponseModel responseModel = ResponseModel.fromJson(response);
        if (responseModel.status) {
          MessageHelper.showSnackBarMessage(
              message: responseModel.message, status: responseModel.status);
          AppRouter.goToAndReplacment(ScreenName.loginScreen);
        }
      } catch (error) {
        handleError(error);
      }
      isLoading = true;
      notifyListeners();
    }
  }

  void forgetPassword({required String email, required var forgetkey}) async {
    if (forgetkey.currentState!.validate()) {
      isLoading = false;
      notifyListeners();
      try {
        var response = await AuthApi().forgetPassword(email: email);
        ResponseModel responseModel = ResponseModel.fromJson(response);
        if (responseModel.status) {
          MessageHelper.showSnackBarMessage(
              message: responseModel.message, status: responseModel.status);
          Navigator.push(
            AppRouter.navigatorKey.currentContext!,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  ResetPassowrdScreen(code: response["code"].toString()),
            ),
          );
        }
      } catch (error) {
        handleError(error);
      }
      isLoading = true;
      notifyListeners();
    }
  }

  void resetPassowrd(
      {required String email,
      required String code,
      required String password,
      required var resetKey}) async {
    if (resetKey.currentState!.validate()) {
      isLoading = false;
      notifyListeners();
      try {
        var response = await AuthApi()
            .resetPassowrd(email: email, code: code, password: password);
        ResponseModel responseModel = ResponseModel.fromJson(response);
        if (responseModel.status) {
          MessageHelper.showSnackBarMessage(
              message: responseModel.message, status: responseModel.status);
          AppRouter.goToAndReplacment(ScreenName.loginScreen);
        }
      } catch (error) {
        handleError(error);
      }
      isLoading = true;
      notifyListeners();
    }
  }
}
