import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CommonTextField extends StatelessWidget {
  const CommonTextField.primary({
    super.key,
    this.label,
    this.hint,
    this.obscureText = false,
    required this.controller,
    this.errorText,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.title,
    this.enabled = true,
    this.constraints,
    this.helperText,
    this.prefix,
    this.fillColor,
  })  : onObscure = null,
        initialValue = null,
        padding = null,
        phoneField = false,
        maxLines = 1,
        minLines = 1,
        keyboardType = null;


  final String? label;
  final String? hint;
  final bool obscureText;
  final VoidCallback? onObscure;
  final TextEditingController controller;
  final String? errorText;
  final String? initialValue;
  final VoidCallback? onTap;
  final TextAlign textAlign;
  final bool readOnly;
  final BoxConstraints? constraints;
  final EdgeInsets? padding;
  final int maxLines;
  final int minLines;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? helperText;
  final String? title;
  final bool phoneField;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: colors.errorColor,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              title ?? '',
              style: typography.bodyLarge?.copyWith(color: colors.text),
            ),
          ),
        ),
        TextFormField(

          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          initialValue: initialValue,
          onTap: onTap,
          style: typography.titleMedium,
          enabled: enabled,
          maxLines: maxLines,
          minLines: minLines,
          controller: controller,
          textAlign: textAlign,
          onChanged: onChanged,
          cursorColor: colors.accentColor,
          obscureText: obscureText,
          validator: validator,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          obscuringCharacter: '•',
          decoration: InputDecoration(
            counterText: '',
            constraints: constraints,
            contentPadding: padding,
            hintText: hint,
            helperText: helperText,
            prefixIcon:  prefix,
            hintStyle: typography.bodyLarge?.copyWith(color: colors.text),
            suffixIcon: suffix,
            border: errorText != null ? errorBorder : null,
            enabledBorder: errorText != null ? errorBorder : null,
            focusedBorder: errorText != null ? errorBorder : null,
            fillColor: fillColor ?? Colors.white,
            filled: true,
          ),
        ),
        Visibility(
          visible: errorText != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText ?? '',
              style: typography.bodyLarge?.copyWith(color: colors.errorColor),
            ),
          ),
        ),
      ],
    );
  }

}
