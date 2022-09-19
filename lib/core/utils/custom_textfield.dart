 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../theme/app_theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.width = double.infinity,
      this.isPassword = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.maxLines = 1,
      this.suffixIcon,
      this.counterText,
      this.enabled = true,
      this.onFieldSubmitted,
      this.focusNode,
      this.inputFormatters,
      this.onChanged,
      this.contentPadding,
      this.labelText})
      : super(key: key);
  final String? hintText;
  final double? width;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? labelText;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final String? counterText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: widget.isPassword!,
      validator: widget.validator,
      maxLength: widget.maxLength,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Color(0xFF7f7f7f),
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: AppTheme.defaultTheme.highlightColor,
        ),
        suffixIcon: widget.suffixIcon,
        counterText: widget.counterText,
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.only(left: 25),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: AppTheme.defaultTheme.primaryColor,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: AppTheme.defaultTheme.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: AppTheme.defaultTheme.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: AppTheme.defaultTheme.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Colors.black26
              //color: AppTheme.defaultTheme.primaryColor,
              ),
        ),
      ),
    );
  }
}
