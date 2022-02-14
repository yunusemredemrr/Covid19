import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff28429A);
const Color kWhite = Color(0xffffffff);
const Color kErrorTextColor = Colors.red;
const Color kSuccessColor = Color(0xff5cb85c);
const Color kBackGroundColor = Color(0xffF8F8F8);
const Color kBlack = Color(0xff000000);
const kDisabledButtonColor = Color(0xffDADADA);
const kGrey = Color(0xffBBBCC7);
const kNavigationBarBlack = Color(0xffA2A7B4);
final kSplashColor = const Color(0xff1a4298).withOpacity(0.2);

Size mSize(context) {
  return MediaQuery.of(context).size;
}

EdgeInsets mPadding(context) {
  return MediaQuery.of(context).padding;
}

TextStyle kContentStyleThin(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kHintTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kLargeTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kLoginButtonTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}

const List<String> kCountries = [
  "Bulgaria",
  "Finland",
  "France",
  "Germany",
  "Greece",
  "Ireland",
  "Italy",
  "Poland",
  "Portugal",
  "Romania",
  "Russia",
  "Spain",
  "Turkey",
  "UK",
];
