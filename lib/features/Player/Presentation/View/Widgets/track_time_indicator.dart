import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';

class TrackTimeIndicator extends StatelessWidget {
  const TrackTimeIndicator({
    super.key,
    required this.player,
  });

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder3(
      initialData: InitialDataTuple3(
        const Duration(seconds: 1),
        const Duration(seconds: 2),
        1,
      ),
      streams: StreamTuple3(
        player.positionStream,
        player.bufferedPositionStream,
        player.currentIndexStream,
      ),
      builder: (context, snapshots) {
        if (snapshots.snapshot1.data == player.duration) {
          BlocProvider.of<SurahCubit>(context)
              .setAudioName(snapshots.snapshot3.data! + 2);
          player.seekToNext();
        }
        return Padding(
          padding:
              const EdgeInsets.only(top: 42, left: 30, right: 30, bottom: 12),
          child: ProgressBar(
            timeLabelLocation: TimeLabelLocation.above,
            bufferedBarColor: kTextColor.withOpacity(0.25),
            progress: snapshots.snapshot1.data!,
            buffered: snapshots.snapshot2.data!,
            total: player.duration ?? Duration.zero,
            thumbColor: kTextColor,
            baseBarColor: kTextColor.withOpacity(0.18),
            progressBarColor: kTextColor,
            timeLabelTextStyle:
                const TextStyle(color: kTextColor, fontSize: 16),
            onSeek: (value) async {
              await player.seek(value);
            },
          ),
        );
      },
    );
  }
}
