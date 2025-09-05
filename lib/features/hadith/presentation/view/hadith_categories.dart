import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/core/route_builder.dart';
import 'package:quran_app/features/hadith/presentation/view/hadith_view.dart';
import 'package:quran_app/features/hadith/presentation/view_model/hadith_cubit/hadith_cubit.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class HadithCategories extends StatelessWidget {
  const HadithCategories({super.key});

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
            const CustomAppBar(title: 'أحاديث'),
            SliverList.builder(
              itemCount: rawytitles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ListItem(
                    icon: Icons.person,
                    title: rawytitles.values.toList()[index],
                    onTap: () {
                      BlocProvider.of<HadithCubit>(context).getAhadith(
                        rawyCode: rawytitles.keys.toList()[index],
                        from: 1,
                        to: 20,
                      );
                      Navigator.push(
                        context,
                        RouteBuilder().goto(
                          HadithView(
                            rawy: rawytitles.values.toList()[index],
                            rawyCode: rawytitles.keys.toList()[index],
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
