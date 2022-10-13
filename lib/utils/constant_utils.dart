import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

addHorizantalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

class ImagePath {
  static const String basePathImages = 'assets/images/';
  static const String basePathIcons = 'assets/icons/';

  //images
  static const String splash = '${basePathImages}splash.png';
  static const String homeImage = '${basePathImages}home_image.png';
  static const String userImage = '${basePathImages}person_image.png';

// 
  //icons
  static const String userIcon = '${basePathIcons}user_icon.png';
  static const String passwrodIcon = '${basePathIcons}password_icon.png';
  static const String emailIcon = '${basePathIcons}email_icon.png';
  static const String arrowBackIcon = '${basePathIcons}arrow_back_icon.png';
}

class AppColors {
  //#
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF0883EF);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF21AA93);
  static const Color gray = Color(0xFF828282);
  static const Color graydark = Color(0xFF3B3B3B);
}
