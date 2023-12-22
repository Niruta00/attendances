import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hinttext;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      this.controller,
      this.label,
      this.hinttext,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            label: Text(label!),
            hintText: hinttext?? "Hint Text"),
      ),
    );
  }
}
