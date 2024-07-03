import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeTextFormFieldParams {
  final TextEditingController? textEditingController;
  final String? hint;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function()? onRightTap;
  final TextInputAction textInputAction;
  final double borderRadius;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final InputBorder? disableBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? borderColor;
  final EdgeInsets? margin;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double? width;
  final int? maxLines;
  final Color? hintColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? label;
  final bool readOnly;
  final bool isDense;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final TextStyle? styleLabel;

  ThemeTextFormFieldParams({
    this.textEditingController,
    this.hint,
    this.leftIcon,
    this.rightIcon,
    this.validator,
    this.obscureText = false,
    this.onRightTap,
    this.textInputAction = TextInputAction.next,
    this.borderRadius = 5,
    this.style,
    this.hintStyle,
    this.disableBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.borderColor,
    this.margin,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.width,
    this.maxLines,
    this.hintColor,
    this.inputFormatters,
    this.initialValue,
    this.label,
    this.readOnly = false,
    this.isDense = true,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.styleLabel,
  });
}
