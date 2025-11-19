import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:flutter/material.dart';

class CommonCircularIndicator extends StatelessWidget {
  const CommonCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
    );
  }
}
