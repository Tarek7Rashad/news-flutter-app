import 'package:flutter/material.dart';
import 'package:news_app/shared/components/constant.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
    this.validate,
    this.controller,
    this.initialValue,
  });
  final String hintText;
  final String labelText;
  final IconButton? suffix;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? initialValue;

  final String? Function(String?)? validate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validate,
      style: const TextStyle(color: kblackColor, fontSize: 20),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 70),
        labelText: labelText,
        labelStyle: const TextStyle(color: kblueGreyColor, fontSize: 20),
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 150, 149, 149), fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 2,
            color: kTextFieldBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 2,
            color: kTextFieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 2,
            color: kblueGreyColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 2,
            color: kblueGreyColor,
          ),
        ),
      ),
    );
  }
}
