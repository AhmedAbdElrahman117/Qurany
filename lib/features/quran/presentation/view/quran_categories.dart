import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/core/route_builder.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class QuranCategories extends StatelessWidget {
  const QuranCategories({super.key});

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
            const CustomAppBar(title: 'القرءان الكريم'),
            SliverList.builder(
              itemCount: quranCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ListItem(
                    icon: quranCategories[index].icon,
                    title: quranCategories[index].title,
                    onTap: () {
                      Navigator.push(
                        context,
                        RouteBuilder().goto(quranCategories[index].option),
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


// ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             itemCount: quranOptions.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 40),
//                 child: ListItem(
//                   icon: quranOptions[index].icon,
//                   title: quranOptions[index].title,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       RouteBuilder().goto(quranOptions[index].option),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),