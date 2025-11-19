import 'package:flutter/material.dart';

abstract class AppColor {
  const AppColor({
    required this.primary,
    required this.text,
    required this.background,
    required this.cardBackground,
    required this.errorColor,
    required this.iconBackground,
    required this.button,
    required this.dividerColor,
    required this.borderColor,
    required this.inactiveColor,
    required this.iconSecondary,
    required this.secondaryBlue,
    required this.accentColor,
  });

  final Color background;
  final Color primary;
  final Color secondaryBlue;
  final Color cardBackground;
  final Color iconBackground;
  final Color iconSecondary;
  final Color text;
  final Color button;
  final Color dividerColor;
  final Color borderColor;
  final Color inactiveColor;
  final Color errorColor;
  final Color accentColor;
}

class AppColorLight implements AppColor {
  @override
  Color get primary => const Color.fromRGBO(255, 188, 45, 1);

  @override
  Color get text => const Color.fromRGBO(71, 55, 41, 1);

  @override
  Color get background => const Color.fromRGBO(243, 242, 238, 1);

  @override
  Color get cardBackground => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get errorColor => const Color.fromRGBO(250, 112, 112, 1);

  @override
  Color get iconBackground => const Color.fromRGBO(240, 242, 243, 1);

  @override
  Color get button => const Color.fromRGBO(255, 188, 45, 1);

  @override
  Color get dividerColor => const Color.fromRGBO(235, 238, 239, 1);

  @override
  Color get borderColor => const Color.fromRGBO(224, 224, 224, 1);

  @override
  Color get inactiveColor => const Color.fromRGBO(190, 186, 172, 1);

  @override
  Color get iconSecondary => const Color.fromRGBO(190, 190, 190, 1);

  @override
  Color get secondaryBlue => const Color.fromRGBO(234, 244, 250, 1);

  @override
  Color get accentColor => Colors.blue;
}

class AppColorDark implements AppColor {
  @override
  Color get primary => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get text => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get background => const Color.fromRGBO(17, 17, 17, 1);

  @override
  Color get cardBackground => const Color.fromRGBO(0, 36, 57, 1);

  @override
  Color get errorColor => const Color.fromRGBO(250, 112, 112, 1);

  @override
  Color get iconBackground => const Color.fromRGBO(55, 55, 55, 1);

  @override
  Color get button => const Color.fromRGBO(255, 188, 45, 1);

  @override
  Color get dividerColor => const Color.fromRGBO(55, 55, 55, 1);

  @override
  Color get borderColor => const Color.fromRGBO(75, 75, 75, 1);

  @override
  Color get inactiveColor => const Color.fromRGBO(190, 190, 190, 1);

  @override
  Color get iconSecondary => const Color.fromRGBO(190, 190, 190, 1);

  @override
  Color get secondaryBlue => const Color.fromRGBO(0, 36, 57, 1);

  @override
  Color get accentColor => Colors.blue;
}
