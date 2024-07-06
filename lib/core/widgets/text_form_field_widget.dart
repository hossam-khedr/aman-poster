import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? readOnly;
  final bool obscureText;

  final Widget? suffixIcon;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    this.keyboardType,
    required this.controller,
    this.readOnly,
    this.onTap,
    this.suffixIcon, this.validator,required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ,
      validator:validator ,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      onTap: onTap,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black12,


      ),
    );
  }
}