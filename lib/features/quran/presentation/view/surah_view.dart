import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/basmala_khatma.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/loading.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/quran_surah.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class SurahView extends StatelessWidget {
  const SurahView(
      {super.key, required this.surahIndex, required this.surahName});

  final int surahIndex;
  final String surahName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: FutureBuilder<String>(
        future: getSurah(surahIndex),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ModalProgressHUD(
              inAsyncCall: true,
              progressIndicator: const Loading(),
              child: Container(
                color: kBackgroundColor,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('No Data'),
            );
          } else {
            return FadeAnimation(
              animationDuration: kDuration,
              begin: 0,
              end: 1,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  CustomAppBar(title: 'سورة $surahName'),
                  SliverList.list(
                    children: [
                      surahIndex == 9
                          ? const SizedBox(height: 40)
                          : const BasmalaKhatma(isBasmala: true),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: QuranSurah(ayah: snapshot.data!),
                      ),
                      const BasmalaKhatma(isBasmala: false),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Future<String> getSurah(int surahIndex) async {
  List<String> surah = [];
  surah = await compute(
    (message) {
      for (int i = 0; i < getVerseCount(surahIndex); i++) {
        surah.add(
          getVerse(surahIndex, i + 1, verseEndSymbol: true),
        );
      }
      return surah;
    },
    surah,
  );

  return surah.join();
}
