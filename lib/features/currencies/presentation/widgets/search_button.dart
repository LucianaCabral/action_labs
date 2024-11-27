import 'package:flutter/material.dart';

import '../resources/strings_path.dart';

class SearchButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const SearchButton({super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF07B0FB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
          StringPath.buttonResult,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'Roboto',
            height: 30 / 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
