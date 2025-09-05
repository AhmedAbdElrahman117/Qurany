import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/util_button.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.control});

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return UtilButton(
      icon: Icons.copy,
      onPressed: () async {
        await Clipboard.setData(
          ClipboardData(text: control.text),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم النسخ الي الحافظة'),
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
