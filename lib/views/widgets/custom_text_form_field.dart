import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.maxlines,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final int maxlines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      maxLines: maxlines,
      onSaved: onSaved,
      cursorColor: Colors.greenAccent,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.greenAccent),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
