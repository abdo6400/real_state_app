import 'package:flutter/material.dart';
import 'package:user/core/utils/commons.dart';
import '../../../config/locale/app_localizations.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_values.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final void Function(String?)? onSave;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String? label;
  final String? hint;
  final IconData? prefix;
  final IconData? suffix;
  final Function()? suffixPressed;
  final bool isClickable = true;
  final bool readOnly;
  final int maxLines;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  const DefaultTextFormField(
      {super.key,
      required this.controller,
      required this.type,
      this.onSave,
      this.onChange,
      this.onTap,
      this.validate,
      this.hint,
      this.label,
      this.prefix,
      this.suffix,
      this.readOnly = false,
      this.suffixPressed,
      this.isPassword = false,
      this.maxLines = 1,
      this.contentPadding,
      this.textColor,
      this.hintColor = AppColors.greyBarel,
      this.color,
      this.backgroundColor,
      this.radius = 16,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: AppColors.primary,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTapOutside: (event) => context.closeKeyboard(),
      enabled: isClickable,
      onSaved: onSave,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      readOnly: readOnly,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: AppValues.font * 16,
          fontWeight: FontWeight.w400,
          color: textColor ?? AppColors.black),
      decoration: InputDecoration(
        prefixIconColor: AppColors.black,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: color != null ? color! : AppColors.lightGrey),
        ),
        contentPadding: contentPadding,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: color != null ? color! : AppColors.primary),
        ),
        border: UnderlineInputBorder(
          borderSide:
              BorderSide(color: color != null ? color! : AppColors.lightGrey),
        ),
        labelText: label != null ? label!.tr(context) : null,
        labelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: textColor ?? AppColors.hintColor.withOpacity(0.7)),
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w800,
            color: textColor ?? AppColors.hintColor),
        hintText: hint != null ? hint!.tr(context) : null,
        floatingLabelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.blueLight),
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                color: textColor ?? AppColors.primary,
              )
            : null,
        suffixIcon: suffix != null
            ? GestureDetector(
                onTap: suffixPressed,
                child: Icon(
                  suffix,
                  color: textColor ?? AppColors.hintColor,
                  size: AppValues.font * 28,
                ),
              )
            : null,
      ),
    );
  }
}
