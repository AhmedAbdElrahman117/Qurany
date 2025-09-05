import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/mixer_app_bar.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_control_buttons.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/track_time_indicator.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_states.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/loading.dart';

class QuranMixer extends StatelessWidget {
  const QuranMixer({
    super.key,
    required this.controller,
    required this.player,
    required this.animationController,
  });

  final DraggableScrollableController controller;
  final AudioPlayer player;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurahCubit, SurahStates>(
      listener: (context, state) {
        if (state is AudioFailed) {
          showErrorDialog(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AudioLoading,
          progressIndicator: const Loading(),
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: MixerAppBar(
              appbar: AppBar(),
              controller: controller,
              player: player,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Lottie.asset(
                    'assets/images/mp3 wave.json',
                    animate: true,
                    backgroundLoading: true,
                  ),
                ),
                TrackTimeIndicator(player: player),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 60,
                    top: 30,
                    left: 12,
                    right: 12,
                  ),
                  child: TrackControlButtons(
                    buttonsSize: 45,
                    player: player,
                    animationController: animationController,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
