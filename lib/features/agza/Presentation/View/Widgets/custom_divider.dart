import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.25,
      child: const Divider(
        color: kTextColor,
        thickness: 2,
      ),
    );
  }
}
