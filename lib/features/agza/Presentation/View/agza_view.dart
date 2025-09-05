import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/core/route_builder.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/agza/Presentation/View/Widgets/juz_surah.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class AgzaView extends StatelessWidget {
  const AgzaView({super.key});

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
            const CustomAppBar(title: 'اجزاء'),
            SliverList.builder(
              itemCount: totalJuzCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ListItem(
                    icon: FontAwesomeIcons.bookOpen,
                    title: 'الجزء ${index + 1}',
                    onTap: () {
                      Navigator.push(
                        context,
                        RouteBuilder().goto(
                          JuzSurah(juzIndex: index + 1),
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
