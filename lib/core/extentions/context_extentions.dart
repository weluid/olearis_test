import 'package:olearistest/core/theme/colors.dart';
import 'package:olearistest/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  S get l10n => S.of(this);

  TextTheme get typography => Theme.of(this).textTheme;

  AppColor get colors => Theme.of(this).brightness == Brightness.dark
      ? AppColorLight()
      : AppColorLight();
}


