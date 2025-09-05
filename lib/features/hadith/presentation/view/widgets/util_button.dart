import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class UtilButton extends StatelessWidget {
  const UtilButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.buttonColor,
    this.iconColor,
  });

  final IconData icon;
  final Color? buttonColor;
  final Color? iconColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      style: IconButton.styleFrom(
        backgroundColor: buttonColor ?? kBackgroundColor,
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor ?? kTextColor,
      ),
    );
  }
}
