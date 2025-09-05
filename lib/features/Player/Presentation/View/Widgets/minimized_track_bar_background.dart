import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class MinimizedTrackBarBackground extends StatelessWidget {
  const MinimizedTrackBarBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: 75,
      decoration: BoxDecoration(
        color: kBackgroundColor,
      ),
      child: child,
    );
  }
}
