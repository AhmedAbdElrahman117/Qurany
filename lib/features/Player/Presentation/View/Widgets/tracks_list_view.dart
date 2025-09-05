import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class TracksListView extends StatelessWidget {
  const TracksListView({
    super.key,
    required this.player,
    required this.controller,
  });

  final AudioPlayer player;
  final DraggableScrollableController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CustomAppBar(title: 'استماع'),
        SliverList.builder(
          itemCount: totalSurahCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListItem(
                icon: FontAwesomeIcons.volumeHigh,
                title: 'سورة ${getSurahNameArabic(index + 1)}',
                onTap: () {
                  controller.animateTo(
                    0.95,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                  );
                  BlocProvider.of<SurahCubit>(context).setVisible(true);
                  BlocProvider.of<SurahCubit>(context).playAudio(player, index);
                  BlocProvider.of<SurahCubit>(context).setAudioName(index + 1);
                },
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}
