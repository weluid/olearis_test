import 'package:flutter/material.dart';

class Extensions {}

extension StringCasingExtension on String {
  String capitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

extension WidgetExtention on Widget {
  void showBottomSheet({
    required BuildContext context,
    Color? backgroundColor,
    double? radius,
    double? height,
    Color? barrierColor,
    bool isDismissible = true,
    bool isScrollControlled = true,
    bool enableDrag = false,
    EdgeInsets? padding,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius ?? 16)),
      ),
      constraints: height != null ? BoxConstraints(maxHeight: height) : null,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? Colors.transparent,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      elevation: 0,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: IntrinsicHeight(child: this),
      ),
    );
  }
}
