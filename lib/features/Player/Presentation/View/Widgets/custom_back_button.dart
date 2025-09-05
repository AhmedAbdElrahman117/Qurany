import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.controller,
  });

  final DraggableScrollableController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        controller.animateTo(
          0.08,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
        );
      },
      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
        size: 35,
        color: kTextColor,
      ),
    );
  }
}
