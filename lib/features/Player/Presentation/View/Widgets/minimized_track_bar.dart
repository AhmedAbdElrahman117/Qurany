import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/minimized_track_bar_background.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_control_buttons.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_name.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';

class MinimizedTrackBar extends StatelessWidget {
  const MinimizedTrackBar({
    super.key,
    required this.animationController,
    required this.player,
  });

  final AnimationController animationController;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return MinimizedTrackBarBackground(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Lottie.asset(
                'assets/images/mp3 wave.json',
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              TrackName(
                text: 'سورة ${BlocProvider.of<SurahCubit>(context).surahName}',
              ),
            ],
          ),
          TrackControlButtons(
            buttonsSize: 30,
            animationController: animationController,
            player: player,
          ),
        ],
      ),
    );
  }
}
