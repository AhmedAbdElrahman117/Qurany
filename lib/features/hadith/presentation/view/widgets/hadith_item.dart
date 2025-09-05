import 'package:flutter/material.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/copy_button.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/share_button.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/hadith_counter.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/hadith_text.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.text, this.showConut, this.count});

  final String text;

  final bool? showConut;

  final String? count;

  @override
  Widget build(BuildContext context) {
    final TextEditingController control = TextEditingController(text: text);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CopyButton(control: control),
              Visibility(
                visible: showConut ?? false,
                replacement: ShareButton(control: control),
                child: HadithCounter(
                  text: count == null
                      ? ''
                      : count!.isEmpty
                          ? '1 مرة'
                          : '$count مرات',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          HadithText(text: text, control: control),
        ],
      ),
    );
  }
}
