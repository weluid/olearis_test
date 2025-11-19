import 'package:flutter/material.dart';
import 'package:olearistest/core/utils/constants.dart';
import 'package:olearistest/generated/assets.gen.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: logoSize),
            child: Assets.logo.svg(width: logoSize),
          ),
        ),
      ),
    );
  }
}
