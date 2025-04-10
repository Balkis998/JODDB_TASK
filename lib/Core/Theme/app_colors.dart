import 'package:flutter/material.dart';

class AppColors {
  static Color _colorFromHex(String hexColor) {
    final color = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$color', radix: 16));
  }

  static Color _colorOpacity20FromHex(String hexColor) {
    final color = hexColor.replaceAll('#', '');
    return Color(int.parse('33$color', radix: 16));
  }

  // 0x38FFFFFF

  // * color App

  static Color mainColor = _colorFromHex('#5F4929');
  static Color lightMainColor = _colorFromHex('#243A61');

  static Color primary = _colorFromHex('#C49A22');

  static Color secondaryColor = _colorFromHex('#BE9B37');
  static Color darkSecondaryColor = _colorFromHex('#B89D59');

  static Color blackColor = _colorFromHex('#000000');

  static Color formHintTextColor = _colorFromHex('#DFE0DF');
  static Color grey = _colorFromHex('#F8F9F9');
  static Color blue = _colorFromHex('#00ABD5');

  static Color borderColor = _colorFromHex('#ADADAD');
  static Color hintColor = _colorFromHex('#BABABA');
  static Color darkGrey = _colorFromHex('#959595');

  static Color white = _colorFromHex('#FFFFFF');

  static Color formBorderColor = _colorFromHex("#E9E9E9");
  static Color formFillColor = _colorOpacity20FromHex("#FFFFFF");
  static Color formReadOnlyColor = _colorOpacity20FromHex("#E0DDDD");
  static Color formReadOnlyTextColor = _colorFromHex('#848383');

  static Color errorColor = _colorFromHex("#D70404");

  static Color green = _colorFromHex("#3FC700");
  static Color lightGreen = _colorFromHex("#E5FFF1");
  static Color veryLightGrey = _colorFromHex("#F3F0F0");
  static Color borderGrey = _colorFromHex("#CAC8C8");

  static Color orange = _colorFromHex("#EF7605");
  static Color red = _colorFromHex('#FF270E');
  static Color lightGrey = _colorFromHex("#8F8E8F");
  static Color lightText = _colorFromHex("#A9A7A7");
  static Color dividerColor = _colorFromHex("#CDCBCB");
  static Color lightblue = _colorFromHex('#F6FAFF');
  static Color lightyellow = _colorFromHex('#FFF3D8');
}
