import 'package:flutter/material.dart';

Widget loginText(String text, TextStyle textStyle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
        child: Text(
      text,
      style: textStyle,
    )),
  );
}




class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      this.prefixIcon,
      this.hintText,
      this.hintStyle,
      this.validator,
      this.controller});

  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: height*0.099,
      width: width*0.8,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            hintText: hintText,
            hintStyle: hintStyle,
            errorStyle: const TextStyle(color: Colors.white)),
        cursorHeight: 18,
      ),
    );
  }
}
