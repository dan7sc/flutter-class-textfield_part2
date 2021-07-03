import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatters,
    this.controller,
    this.icon,
    this.suffixIcon,
  }) : super(key: key);

  final String errorMessage = '';

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorText: errorMessage,
        errorStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange.shade800,
        ),
      ),
      inputFormatters: inputFormatters,
    );
  }
}
