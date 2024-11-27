import 'package:flutter/material.dart';

import '../resources/strings_path.dart';

class ExchangeResult extends StatelessWidget {
  final String currentDateTime;
  final String enteredCurrency;
  final TextEditingController resultController;

  const ExchangeResult({
    super.key,
    required this.currentDateTime,
    required this.enteredCurrency,
    required this.resultController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.grey, thickness: 1),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringPath.headerResult,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  height: 28 / 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentDateTime,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Text(
                    '$enteredCurrency/BRL',
                    style: const TextStyle(
                      color: Color(0xFF07B0FB),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF07B0FB).withOpacity(0.1),
              borderRadius: BorderRadius.zero,
            ),
            child: TextField(
              controller: resultController,
              readOnly: true,
              decoration: const InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: Color(0xFF07B0FB),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
