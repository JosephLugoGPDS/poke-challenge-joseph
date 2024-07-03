import 'package:app/core/extension/size_extension.dart';
import 'package:app/core/ui/widgets/text_form_field/theme_text_form_field_params.dart';
import 'package:flutter/material.dart';
import 'package:app/core/extension/context.dart';

class ThemeTextFormField extends StatelessWidget {
  const ThemeTextFormField({
    super.key,
    required this.params,
  });

  final ThemeTextFormFieldParams params;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: params.margin ??
          EdgeInsets.only(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
          ),
      child: TextFormField(
        controller: params.textEditingController,
        keyboardType: params.keyboardType,
        onChanged: params.onChanged,
        onTap: params.onTap,
        textCapitalization: params.textCapitalization,
        readOnly: params.readOnly,
        onFieldSubmitted: params.onSubmitted,
        style: params.style ?? context.primaryTextTheme.bodySmall,
        textInputAction: params.textInputAction,
        obscureText: params.obscureText,
        cursorColor: context.colorScheme.primary,
        maxLines: params.maxLines,
        initialValue: params.initialValue,
        inputFormatters: params.inputFormatters,
        maxLength: params.maxLength,
        validator: params.validator ??
            (String? value) {
              return value!.isEmpty ? 'This field cannot be empty' : null;
            },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: GestureDetector(
              onTap: params.onRightTap, child: Icon(params.rightIcon)),
          floatingLabelStyle: params.styleLabel,
          hintStyle: params.hintStyle ??
              context.primaryTextTheme.bodySmall!.copyWith(
                color: params.hintColor ?? context.colorScheme.surfaceVariant,
              ),
          labelStyle: params.styleLabel ?? context.primaryTextTheme.bodySmall,
          border: InputBorder.none,
          hintText: params.hint,
          isDense: params.isDense,
          hintMaxLines: 1,
          label: params.label != null
              ? Text(
                  params.label!,
                  style:
                      params.styleLabel ?? context.primaryTextTheme.bodySmall,
                )
              : null,
          disabledBorder: params.disableBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.colorScheme.secondary, width: 1.2),
              ),
          enabledBorder: params.enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.colorScheme.secondary, width: 1.2),
              ),
          focusedBorder: params.focusedBorder ??
              OutlineInputBorder(
                borderSide:
                    BorderSide(color: context.colorScheme.primary, width: 1.2),
              ),
        ),
      ),
    );
  }
}
