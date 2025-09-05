import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/play_pause.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_backword.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_forword.dart';

class TrackControlButtons extends StatelessWidget {
  const TrackControlButtons({
    super.key,
    required this.buttonsSize,
    required this.player,
    required this.animationController,
  });

  final double buttonsSize;
  final AudioPlayer player;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TrackForward(size: buttonsSize, player: player),
        PlayPause(
          size: buttonsSize + 15,
          player: player,
          animationController: animationController,
        ),
        TrackBackword(size: buttonsSize, player: player),
      ],
    );
  }
}
