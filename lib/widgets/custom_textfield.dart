import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController controller;
  final Widget? icon;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final String? errorText;
  final void Function(String)? onChanged;
  final Icon? prefixIcon;
  final bool willContainPrefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    this.labelText = "",
    required this.hintText,
    required this.controller,
    this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
    this.validator,
    this.errorText,
    this.onChanged,
    this.prefixIcon,
    this.willContainPrefix = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      inputFormatters: inputFormatters,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF7266f8),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF7266f8),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF7266f8),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
        suffixIcon: icon,
        errorText: errorText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: EdgeInsets.all(10),
        labelText: labelText,
        // labelStyle:
      ),
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
