import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_button.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';

class TrackForward extends StatelessWidget {
  const TrackForward({
    super.key,
    required this.size,
    required this.player,
  });

  final double size;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return TrackButton(
      icon: FontAwesomeIcons.forwardStep,
      iconSize: size,
      onPressed: () async {
        await player.seekToNext();
        int index = player.currentIndex ?? 1;
        int current = index + 1;
        BlocProvider.of<SurahCubit>(context).setAudioName(current);
      },
    );
  }
}
