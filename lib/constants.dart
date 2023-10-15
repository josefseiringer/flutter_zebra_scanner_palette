import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

//Notion API
// StoreUser
var kNotionStoreUserKey = 'secret_CDW3vl05rKA9JIoHukM5dkmZKibsKVtTubtTMnZ9pZ';
var kDatabaseUser = '44321b2c-738b-4da8-9794-83d93b1925cd';
var kLoadStoreUserUrl =
    'https://api.notion.com/v1/databases/$kDatabaseUser/query';
//Paletten Administration
var kNotionApiKey = 'secret_HYsIdiYWxgkabjlqcRfur1NaCdVdLFtXPLx07D024aU';
var kDatabasePallet = 'a1594102-8d3a-47ed-97cb-15772253e6ae';
var kLoadPageUrl = 'https://api.notion.com/v1/databases/$kDatabasePallet/query';

//gemeinsame Urls
var kBasePageURL = 'https://api.notion.com/v1/pages';
var kPatchDatabaseURL = 'https://api.notion.com/v1/databases';
var khttpHeader = {
  HttpHeaders.authorizationHeader: 'Bearer $kNotionApiKey',
  'Content-Type': 'application/json',
  'Notion-Version': '2022-06-28'
};

// Location PTV-API
var kPtvApiKey =
    'RVVfZmRhYWM1ZDI3NDZjNDc4MmE3YWNlYWJiODJjZWNlNmI6ZjIzZjc1MmItODNlNi00ODVhLThlOGItNGUyMzkzNjZiNDRj';

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

SnackbarController kDisplaySnackBarSavePallet(String szInfoText) {
  return Get.snackbar('Info', szInfoText,
      backgroundColor: Colors.green[600],
      duration: const Duration(seconds: 3),
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
