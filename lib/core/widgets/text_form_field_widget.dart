import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? readOnly;
  final bool obscureText;
  final String? hintText;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final String? Function(String?)? validator;
 final void Function(String)? onChanged;

  const TextFormFieldWidget({
    super.key,
    this.keyboardType,
    required this.controller,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.validator,
    required this.obscureText,
    this.hintText,
    this.prefixIcon, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      onTap: onTap,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black12,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
