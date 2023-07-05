import 'package:flutter/material.dart';

TextStyle get commonTextStyle => const TextStyle(fontSize: 14);

InputDecoration commonInputDecoration(Icon icon, String hintText) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    hintText: hintText,
    hintStyle: commonTextStyle,
    icon: icon,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
  );
}
