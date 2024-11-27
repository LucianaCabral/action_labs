import 'package:flutter/material.dart';

import '../resources/strings_path.dart';

class CurrencyInputField extends StatelessWidget {
  final TextEditingController controller;

  const CurrencyInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: const Color(0x00f4f4f4),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            labelText: StringPath.labelText,
            labelStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
            floatingLabelStyle: TextStyle(color: Colors.blue, fontSize: 16),
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
