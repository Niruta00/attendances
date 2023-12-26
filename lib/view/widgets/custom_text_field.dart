import 'package:attendu/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hinttext;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    this.controller,
    this.label,
    this.hinttext,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.black, 
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color:
                  AppColors.primaryColor, // Set the border color when focused
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          hintText: hinttext ?? "Hint Text",
        ),
      ),
    );
  }
}
