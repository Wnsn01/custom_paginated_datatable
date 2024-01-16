import 'package:flutter/material.dart';

InputDecoration searchHeader(
    {required String labelText,
    String? hintText,
    Color? colorHintText,
    Color colorLabel = Colors.black87,
    Color colorBorder = Colors.black,
    Widget? suffixIcon}) {
  return InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    labelText: labelText,
    labelStyle:
        TextStyle(color: colorLabel, fontWeight: FontWeight.bold, fontSize: 14),
    hintText: hintText,
    hintStyle: TextStyle(color: colorHintText),
    suffixIcon: suffixIcon,
  );
}