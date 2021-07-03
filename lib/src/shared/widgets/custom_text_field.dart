import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText = '',
    this.labelText = '',
    this.helperText = '',
    this.obscureText = false,
    required this.onChanged,
    required this.inputFormatters,
  }) : super(key: key);

  final String errorMessage = '';

  final String hintText;
  final String labelText;
  final String helperText;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatters;

  // void validateText(String value) {
  //   setState(() {
  //     if (value.isEmpty || (value.length < 10)) {
  //       errorMessage = "Preencha corretamente o campo!";
  //     } else {
  //       errorMessage = "";
  //     }
  //   });
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value) => validateText(value),
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        hintText: "00/00/0000",
        labelText: "Data de Nascimento",
        labelStyle: TextStyle(color: Colors.black),
        helperText: "dd/mm/aaaa",
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
