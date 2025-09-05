import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/custom_back_button.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_name.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_states.dart';

class MixerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MixerAppBar({
    super.key,
    required this.controller,
    required this.appbar,
    required this.player,
  });

  final DraggableScrollableController controller;
  final AppBar appbar;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false,
      leading: CustomBackButton(controller: controller),
      title: BlocBuilder<SurahCubit, SurahStates>(
        builder: (context, state) {
          return TrackName(
            text: 'سورة ${BlocProvider.of<SurahCubit>(context).surahName}',
          );
        },
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => appbar.preferredSize;
}
