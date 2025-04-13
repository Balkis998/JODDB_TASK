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

  static Color mainColor = _colorFromHex('#2E3A59');
  static Color primary = _colorFromHex('#AEAEB3'); //
  static Color secondaryColor = _colorFromHex('#9C2CF3'); //
  static Color secondaryBLueColor = _colorFromHex('#3A49F9');

  static Color backgroundColor = _colorFromHex('#F2F5FF');

  static Color blackColor = _colorFromHex('#000000');
  static Color white = _colorFromHex('#FFFFFF');

  static Color lightColor = _colorFromHex('#E5EAFC');
  static Color grey = _colorFromHex('#6C7278'); // ACB5BB

  static Color borderColor = _colorFromHex('#D7DDF0');
  static Color hintColor = _colorFromHex('#BABABA');

  static Color formBorderColor = _colorFromHex("#D8DEF3");
  static Color formFillColor = _colorOpacity20FromHex("#FFFFFF");

  static Color errorColor = _colorFromHex("#D70404");

  static Color titleColor = _colorFromHex("#BFC8E8");
  static Color red = _colorFromHex('#FF270E');
  static Color infoColor = _colorFromHex('#4D81E7');
}
 // #