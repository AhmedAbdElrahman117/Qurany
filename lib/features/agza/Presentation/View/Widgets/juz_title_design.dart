import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class JuzTitleDesign extends StatelessWidget {
  const JuzTitleDesign({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border.all(color: kTextColor, width: 2),
        borderRadius: const BorderRadiusDirectional.all(
          Radius.elliptical(12, 12),
        ),
      ),
      child: child,
    );
  }
}
