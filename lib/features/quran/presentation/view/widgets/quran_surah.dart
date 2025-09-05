import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class QuranSurah extends StatefulWidget {
  const QuranSurah({
    super.key,
    required this.ayah,
  });

  final String ayah;

  @override
  State<QuranSurah> createState() => _QuranSurahState();
}

class _QuranSurahState extends State<QuranSurah> {
  late bool isTitle;

  @override
  void initState() {
    isTitle = widget.ayah.contains('سُورَةُ');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      widget.ayah,
      textAlign: isTitle ? TextAlign.center : TextAlign.right,
      style: TextStyle(
        height: 3,
        fontSize: isTitle ? 24 : 22,
        fontWeight: FontWeight.bold,
        color: isTitle ? kTextColor : Colors.black,
      ),
    );
  }
}
