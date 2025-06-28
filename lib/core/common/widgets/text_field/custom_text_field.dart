import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../injection/injection.dart';
import '../../config/lang/state/store_current_lang.dart';
import '../../config/theme/src/colors.dart';
import '../../function/validator.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintStyle,
    this.hintText,
    this.controller,
    this.enabled,
    this.isPassword = false,
    this.keyboardType,
    this.isMobileNum = false,
    this.border = true,
    this.isEmail = false,
    this.label,
    this.customValidator,
    this.isIdNumber,
    this.isPassportNumber,
    this.isNumberFormat,
    this.onSubmitted,
    this.onChanged,
    this.confirmPassword,
    this.onSave,
    this.isConfirmPassword,
    this.contentPadding,
    this.isAverage = false,
    this.isNumberFormatWithComma = false,
    this.labelStyle,
    this.onTapOutside,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.autofocus,
    this.maxLength,
    this.readOnly = false,
    this.textInputAction,
    this.filledColor,
    this.onTap,
    this.focusedBorder,
    this.focusNode,
    this.cursorColor,
  this.focusedErrorBorder,
    this.disabledBorder,
    this.inputBorder,
    this.enabledBorder,
    this.errorBorder,
    this.initialValue
  });
  final String? initialValue;
  final InputBorder? enabledBorder;
  final InputBorder? inputBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final TextStyle? hintStyle;
  final OutlineInputBorder? focusedErrorBorder;
  final Color? cursorColor;
  final String? hintText;
  final String? label;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? enabled;
  final bool isPassword;
  final bool isAverage;
  final TextInputType? keyboardType;
  final bool? isMobileNum;
  final bool? isEmail;
  final bool border;
  final bool? isIdNumber;
  final bool? isPassportNumber;
  final bool? isNumberFormat;
  final bool? isNumberFormatWithComma;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isConfirmPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? confirmPassword;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Function(dynamic)? onSave;
  final String? Function(String?)? customValidator;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Function(PointerDownEvent)? onTapOutside;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final bool? autofocus;
  final bool readOnly;
  final Color? filledColor;
  final void Function()? onTap;
  final InputBorder? focusedBorder;
  final FocusNode? focusNode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    String? lang = locator.get<LanguageStorage>().getCurrentLang();
    return TextFormField(

      onTap: widget.onTap,
      maxLines: widget.maxLines ?? 1,
      focusNode: widget.focusNode,

      style: widget.textStyle,
      onSaved: widget.onSave,
      onFieldSubmitted: widget.onSubmitted,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      enabled: widget.enabled ?? true,
      controller: widget.controller,
      obscureText:
          widget.isPassword || widget.isConfirmPassword == true
              ? _isObscure
              : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters:
          widget.isNumberFormat == true
              ? [
                FilteringTextInputFormatter.allow(
                  widget.isNumberFormatWithComma == true
                      ? RegExp(r'^[0-9]+(\.[0-9]*)?')
                      : RegExp("[0-9]"),
                ),
              ]
              : [],
      validator:
          widget.customValidator ??
          (value) => validator(
            value: value,
            context: context,
            isMobileNum: widget.isMobileNum,
            isEmail: widget.isEmail,
            isPassword: widget.isPassword,
            confirmPassword: widget.confirmPassword,
            isAverage: widget.isAverage,
          ),
      cursorColor: AppColors.lightPurple,
      onChanged: widget.onChanged,
      textAlign:
          widget.textAlign ??
          (widget.isMobileNum!
              ? (lang == 'ar'
                  ? TextAlign.right
                  : (lang == 'en' ? TextAlign.left : TextAlign.start))
              : TextAlign.start),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? TextStyle(color: Colors.black.withOpacity(0.5)),
        fillColor: widget.filledColor ?? AppColors.primaryGray,
        filled: true,
        labelText: widget.label,
        labelStyle: widget.labelStyle,
        contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 15),

        enabledBorder: widget.border
            ? widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.transparent),
            )
            : null,

        focusedBorder: widget.border
            ? widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.lightPurple),
            )
            : null,

        errorBorder: widget.border
            ? widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.mainRed),
            )
            : null,

        focusedErrorBorder: widget.focusedErrorBorder ??
            (widget.border
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.mainRed),
            )
                : null),

        disabledBorder: widget.border
            ? widget.disabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.transparent),
            )
            : null,

        border: widget.border
            ? widget.inputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.transparent),
            )
            : const UnderlineInputBorder(),

        suffixIcon: widget.isPassword || widget.isConfirmPassword == true
            ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : widget.suffixIcon,

        prefixIcon: widget.prefixIcon,
      ),

      textInputAction: widget.textInputAction ?? TextInputAction.done,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus ?? false,
      readOnly: widget.readOnly,
    );
  }
}
