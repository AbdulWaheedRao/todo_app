import 'package:flutter/material.dart';

TextFormField textFieldMethod(
    {FormFieldValidator? validator,
    String? hintText,
    TextStyle? textStyle,
    TextInputType? keyboardType,
    TextEditingController? controller}) {
  return TextFormField(
    textInputAction: TextInputAction.newline,
    style: textStyle,
    enableSuggestions: true,
    validator: validator,
    controller: controller,
    keyboardType: keyboardType,
    maxLines: null,
    decoration: InputDecoration(
        border:InputBorder.none,
        hintText: hintText,
        hintStyle:const TextStyle(color: Colors.white)
        ),
  );
}
