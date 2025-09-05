import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/core/route_builder.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDuration: kDuration,
      begin: 0,
      end: 1,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(title: 'القرءان', leading: false),
          SliverList.builder(
            itemCount: appCategories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListItem(
                  icon: appCategories[index].icon,
                  title: appCategories[index].title,
                  onTap: () async {
                    Navigator.push(
                      context,
                      RouteBuilder().goto(appCategories[index].option),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
