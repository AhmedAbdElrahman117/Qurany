import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/util_button.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.control});

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return UtilButton(
      icon: Icons.share,
      iconColor: kBackgroundColor,
      buttonColor: kTextColor,
      onPressed: () async {
        await Share.share(control.text);
      },
    );
  }
}
