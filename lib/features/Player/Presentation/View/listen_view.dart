import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/drag_hand.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/minimized_track_bar.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/quran_mixer.dart';
import 'package:quran_app/features/Player/Presentation/View/Widgets/tracks_list_view.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_states.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/loading.dart';

class ListenView extends StatefulWidget {
  const ListenView({super.key});

  @override
  State<ListenView> createState() => _ListenViewState();
}

class _ListenViewState extends State<ListenView> with TickerProviderStateMixin {
  late AudioPlayer player;
  late DraggableScrollableController controller;
  late AnimationController animationController;
  bool isExapnded = false;

  @override
  void initState() {
    BlocProvider.of<SurahCubit>(context).setVisible(false);

    player = AudioPlayer();

    BlocProvider.of<SurahCubit>(context).setPlaylist(player);

    BlocProvider.of<SurahCubit>(context).listenToErrors(player, context);

    controller = DraggableScrollableController();

    controller.addListener(
      () {
        checkSheetSize();
      },
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    super.initState();
  }

  void checkSheetSize() {
    if (controller.size >= 0.2 && isExapnded != true) {
      setState(() {
        isExapnded = true;
      });
    } else if (controller.size < 0.2 && isExapnded != false) {
      setState(() {
        isExapnded = false;
      });
    }
  }

  @override
  void dispose() {
    player.dispose();
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

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
            body: FadeAnimation(
              animationDuration: kDuration,
              begin: 0,
              end: 1,
              child: Stack(
                children: [
                  TracksListView(
                    player: player,
                    controller: controller,
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    visible: BlocProvider.of<SurahCubit>(context).isVisible,
                    child: DraggableScrollableSheet(
                      controller: controller,
                      initialChildSize: 0.1,
                      minChildSize: 0.1,
                      maxChildSize: 0.95,
                      snap: true,
                      snapAnimationDuration: const Duration(milliseconds: 400),
                      builder: (context, scrollController) {
                        return Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: kBackgroundColor,
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers: [
                              const SliverToBoxAdapter(child: DragHand()),
                              isExapnded
                                  ? SliverFillRemaining(
                                      child: QuranMixer(
                                        controller: controller,
                                        player: player,
                                        animationController:
                                            animationController,
                                      ),
                                    )
                                  : SliverFillRemaining(
                                      child: MinimizedTrackBar(
                                        animationController:
                                            animationController,
                                        player: player,
                                      ),
                                    ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
