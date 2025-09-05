import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class TrackName extends StatelessWidget {
  const TrackName({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: kTextColor,
      ),
    );
  }
}
