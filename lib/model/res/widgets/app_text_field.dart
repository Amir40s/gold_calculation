import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool borderSides;
  final double? radius;
  final TextInputType? keyboardType;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.borderSides = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.radius,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        disabledBorder: (borderSides)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 0),
                borderSide: const BorderSide(color: Colors.black),
              )
            : null,
        focusedBorder: (borderSides)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 0),
                borderSide: const BorderSide(color: Colors.black),
              )
            : null,
        errorBorder: (borderSides)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 0),
                borderSide: const BorderSide(color: Colors.black),
              )
            : null,
        enabledBorder: (borderSides)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 0),
                borderSide: const BorderSide(color: Colors.black),
              )
            : UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(0),
              ),
        fillColor: AppColors.appBackgroundColor,
        focusColor: Colors.black,
        hintStyle: const TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }
}
