import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/core/route_builder.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/quran/presentation/view/surah_view.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        animationDuration: kDuration,
        begin: 0,
        end: 1,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const CustomAppBar(title: 'سور'),
            SliverList.builder(
              itemCount: totalSurahCount,
              itemBuilder: (context, index) {
                String surahName = getSurahNameArabic(index + 1);
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ListItem(
                    icon: FontAwesomeIcons.bookOpen,
                    title: 'سورة $surahName',
                    onTap: () async {
                      Navigator.push(
                        context,
                        RouteBuilder().goto(
                          SurahView(
                            surahIndex: index + 1,
                            surahName: surahName,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}


// Padding(
//           padding: const EdgeInsets.only(
//             top: 30,
//           ),
//           child: ListView.builder(
//             physics: const BouncingScrollPhysics(),
            
//           ),
//         ),
