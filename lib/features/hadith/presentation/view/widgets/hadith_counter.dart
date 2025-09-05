import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class HadithCounter extends StatelessWidget {
  const HadithCounter({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FittedBox(
        child: Text(
          text ?? '',
          style: const TextStyle(
            color: kTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
