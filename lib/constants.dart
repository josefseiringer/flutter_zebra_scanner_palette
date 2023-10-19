import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_zebra_scanner_palette/services/order_model.dart';
import '../pages/login/login_model.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

enum PalettenStatus {
  eingang, //1
  eingangLeer, //4
  ausgang, //3
  ausgangLeer, //5
  umlagerung, //2
}

//HttpHeader Authentification
var kBasicAuth =
    'Basic ${base64.encode(utf8.encode('${dotenv.env['BASIC_AUTH_LOGIN_USER']}:${dotenv.env['BASIC_AUTH_LOGIN_PASSWORD']}'))}';
var kHttpHeaderBasic = {HttpHeaders.authorizationHeader: kBasicAuth};

var kLoginUserData = LoginUser();
var kOrderPalettData = OrderModel('?', '?', '?', '?', '?', '?', '?', '?');

var kLetterSpacing = 2.0;

var kFontSizeDouble = 15.0;

var kFontSizeHeaderDouble = 20.0;

var kPaddingAll = const EdgeInsets.all(8);

var kButtonTextFildHeight = 50.0;

var kBorderRadiusCircular = BorderRadius.circular(10);

var kBorderRadiusCircularRoundEnd = 50.0;

var kBorderColor = const Color(0xffcc0000);

var kHeaderStyle = TextStyle(
  color: Colors.white.withOpacity(0.8),
  fontSize: 20,
  decoration: TextDecoration.none,
  fontFamily: 'Roboto',
  letterSpacing: 3.0,
);

var kHeaderText = 'Hallo,\nBitte Anmelden...';

var kFontFamily = 'Roboto-Light';

var kThemeData = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffededed),
  appBarTheme: const AppBarTheme(
    elevation: 1,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: kBorderColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xff626262)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.yellow),
    ),
  ),
);

SnackbarController kDisplaySnackBar(String szInfoText) {
  return Get.snackbar('Info', szInfoText,
      backgroundColor: Colors.red[600],
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      snackStyle: SnackStyle.GROUNDED);
}

SnackbarController kDisplaySnackBarBlue(String szInfoText) {
  return Get.snackbar('Info', szInfoText,
      backgroundColor: Colors.blue[300],
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      snackStyle: SnackStyle.GROUNDED);
}

SnackbarController kDisplaySnackBarSavePallet(String szInfoText) {
  return Get.snackbar('Info', szInfoText,
      backgroundColor: Colors.green[600],
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      snackStyle: SnackStyle.GROUNDED);
}

var kTextStyleDropDownList = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontFamily: kFontFamily,
  fontStyle: FontStyle.normal,
);

var kTestStyleDataText = TextStyle(
  fontSize: kFontSizeDouble,
  fontFamily: kFontFamily,
);
var kTestStyleHeaderTextBold = TextStyle(
    fontSize: kFontSizeHeaderDouble,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold);
var kTestStyleDataTextError = TextStyle(
  fontSize: kFontSizeDouble,
  fontFamily: kFontFamily,
  color: Colors.red,
);

var kMyTextStyle = TextStyle(
    fontSize: kFontSizeDouble,
    fontFamily: kFontFamily,
    letterSpacing: kLetterSpacing);

//DropDown Styles
var kInputDecorationDropDownMenue = InputDecoration(
  //prefixIcon: Icon(Icons.date_range),
  hintText: 'User'.toUpperCase(),
  contentPadding: const EdgeInsets.all(10),
  hintStyle: TextStyle(letterSpacing: 2, fontSize: kFontSizeDouble),
  filled: true,
  fillColor: const Color.fromARGB(255, 199, 197, 197),
  errorStyle: const TextStyle(color: Colors.yellow),
);

//Button Style
var kButtonStyleOutlined = OutlinedButton.styleFrom(
  backgroundColor: Colors.red,
  foregroundColor: Colors.white,
  fixedSize: const Size(double.infinity, 70),
  textStyle: TextStyle(fontSize: kFontSizeDouble, letterSpacing: 2),
);

var kContainerAuswahlPlatzDecoration = BoxDecoration(
  color: Colors.grey.shade300,
  border: Border.all(
    width: 1,
    color: Colors.black,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(10)),
);
