import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:olearistest/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';

class CommonAlertDialog extends StatelessWidget {
  const CommonAlertDialog({
    super.key,
    required this.title,
    required this.description,
    required this.primaryButtonTitle,
    required this.secondaryButtonText,
    required this.primaryButtonTap,
    required this.secondaryButtonTap,
  });

  final String title;
  final String description;
  final String primaryButtonTitle;
  final String secondaryButtonText;
  final VoidCallback primaryButtonTap;
  final VoidCallback secondaryButtonTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      titlePadding: const EdgeInsets.fromLTRB(40, 30, 32, 10),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: context.colors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: context.typography.headlineMedium,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: context.typography.titleSmall,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CommonButton.outLine(
                  onPressed: secondaryButtonTap.call,
                  label: secondaryButtonText,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CommonButton.primary(
                  onPressed: primaryButtonTap.call,
                  label: primaryButtonTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
