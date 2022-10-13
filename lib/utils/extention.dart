extension ValidationExt on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    String? result;
    if (isEmpty) {
      result = 'enter required data';
    } else if (!(emailRegExp.hasMatch(this))) {
      result = 'enter valid email';
    }
    return result;
  }

  String? get isValidName {
    String? result;
    if (isEmpty) {
      result = 'enter required data';
    }
    return result;
  }

  String? get isValidPassword {
    String? result;

    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (isEmpty) {
      result = 'enter required data';
    } else if (!(passwordRegExp.hasMatch(this))) {
      result = 'enter valid password';
    }
    return result;
  }

  // String? get confirmPassword {
  //   String? result;
  //   if (this.isEmpty) {
  //     result = 'enter required data';
  //   } else if (!(passwordController.text == this)) {
  //     result = 'not match';
  //   }
  //   return result;
  // }

  String? get isValidPhone {
    String? result;
    final phoneRegExp = RegExp(r"^\+?[0-9]{7}$");
    if (isEmpty) {
      result = 'enter required data';
    } else if (!(phoneRegExp.hasMatch(this))) {
      result = 'enter valid phone number';
    }
    return result;
  }
}
