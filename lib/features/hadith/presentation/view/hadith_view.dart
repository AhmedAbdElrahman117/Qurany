import 'package:flutter/material.dart';

import 'package:quran_app/features/hadith/presentation/view/hadith_view_body.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key, required this.rawy, required this.rawyCode});

  final String rawy;
  final String rawyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: HadithViewBody(
          rawy: rawy,
          rawyCode: rawyCode,
        ),
      ),
    );
  }
}
