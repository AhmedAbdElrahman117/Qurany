import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/constants.dart';

class BasmalaKhatma extends StatelessWidget {
  const BasmalaKhatma({
    super.key,
    required this.isBasmala,
  });

  final bool isBasmala;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isBasmala ? basmala : 'صَدَقَ اللهُ العَظيمْ',
        style: const TextStyle(
          height: 3,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: kTextColor,
        ),
      ),
    );
  }
}
