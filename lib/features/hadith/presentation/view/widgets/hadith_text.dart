import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class HadithText extends StatelessWidget {
  const HadithText({
    super.key,
    required this.text,
    required this.control,
  });

  final String text;
  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: text.length,
      readOnly: true,
      controller: control,
      canRequestFocus: false,
      enableInteractiveSelection: false,
      style: const TextStyle(
        color: kTextColor,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        fillColor: kBackgroundColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
