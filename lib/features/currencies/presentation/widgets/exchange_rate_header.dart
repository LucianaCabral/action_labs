import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/asset_path.dart';
import '../resources/strings_path.dart';

class ExchangeRateHeader extends StatelessWidget {
  const ExchangeRateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Image.asset(
            AssetPath.actionlobslogo,
            alignment: Alignment.topCenter,
            scale: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(color: Colors.grey, thickness: 1),
        const SizedBox(height: 8),
        const Text(
          StringPath.title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 30 / 24,
            color: Color(0xFF07B0FB),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
