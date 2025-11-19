import 'package:another_flushbar/flushbar.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:flutter/material.dart';

class FlushBarService {
  void showMessage({
    required String message,
    required BuildContext context,
    int seconds = 4,
  }) {
    final colors = context.colors;
    Flushbar(
      messageText: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Text(
          message,
          style: context.typography.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      boxShadows: const [
        BoxShadow(
          color: Color.fromRGBO(132, 149, 158, 0.15),
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ],
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 70),
      padding: const EdgeInsets.symmetric(horizontal: 21),
      borderRadius: BorderRadius.circular(12),
      borderColor: null,
      backgroundColor: colors.text,
      duration: const Duration(seconds: 4),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    ).show(context).then((result) {});
  }
}
