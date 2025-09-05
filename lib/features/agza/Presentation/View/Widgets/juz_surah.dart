import 'package:al_quran/al_quran.dart';
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

class JuzSurah extends StatefulWidget {
  const JuzSurah({
    super.key,
    required this.juzIndex,
  });

  final int juzIndex;

  @override
  State<JuzSurah> createState() => _JuzSurahState();
}

class _JuzSurahState extends State<JuzSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEBDD),
      body: FutureBuilder<List<String>>(
        future: read(widget.juzIndex),
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
            return const Text('Error');
          } else {
            return FadeAnimation(
              animationDuration: kDuration,
              begin: 0,
              end: 1,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  CustomAppBar(title: 'الجزء ${widget.juzIndex}'),
                  SliverList.list(
                    children: [
                      const BasmalaKhatma(isBasmala: true),
                      for (int i = 0; i < snapshot.data!.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: QuranSurah(ayah: snapshot.data![i]),
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

//loading juz in background
Future<List<String>> read(int juzIndex) async {
  List<String> test = [];
  test = await compute<List<String>, List<String>>(
    (message) {
      List<String> temp = [];
      //loop through all surahs in the juz
      for (int i = 0;
          i < AlQuran.surahDetails.byJuzNumber(juzIndex).length;
          i++) {
        //add surah name
        message
            .add(AlQuran.surahDetails.byJuzNumber(juzIndex).elementAt(i).name);
        //loop through each surah in the juz and store it in a list
        //get all 30 juz
        AlQuran.quranDetails.getFullJuz.bySurah
            //get first juz
            .elementAt(juzIndex - 1)
            //get first surah
            .elementAt(i)
            //get surah's ayat
            .ayahs
            //map all of the and loop
            .asMap()
            .forEach(
          (key, value) {
            //add ayah of the surah
            temp.add(value.text);
            //add surah number
            temp.add(getVerseEndSymbol(value.numberInSurah));
          },
        );
        //add the Whole surah joined as one
        message.add(temp.join());
        //clear the stored surah to get the next one in the juz
        temp.clear();
      }
      return message;
    },
    test,
  );
  return test;
}
