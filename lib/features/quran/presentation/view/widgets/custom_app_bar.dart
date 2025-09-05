import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading = true,
  });

  final String title;
  final bool? leading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kTextColor,
      automaticallyImplyLeading: false,
      leading: leading! ? const BackButton(color: kBackgroundColor) : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          color: kBackgroundColor,
        ),
      ),
      centerTitle: true,
      snap: true,
      floating: true,
    );
  }
}
