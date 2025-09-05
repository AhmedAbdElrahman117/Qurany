import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/agza/Presentation/View/Widgets/custom_divider.dart';
import 'package:quran_app/features/agza/Presentation/View/Widgets/juz_title_design.dart';

class JuzName extends StatelessWidget {
  const JuzName({
    super.key,
    required this.juzIndex,
  });

  final int juzIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomDivider(),
        JuzTitleDesign(
          child: Text(
            'الجزء $juzIndex',
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
