import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class TrackButton extends StatelessWidget {
  const TrackButton({
    super.key,
    required this.icon,
    this.onPressed,
    required this.iconSize,
  });

  final IconData icon;
  final void Function()? onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: kTextColor,
      ),
    );
  }
}
