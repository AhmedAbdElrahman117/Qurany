// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_states.dart';

class SurahCubit extends Cubit<SurahStates> {
  SurahCubit() : super(SurahInitial());

  bool isVisible = false;

  String surahName = '';

  final playlist = ConcatenatingAudioSource(
    children: List.generate(
      totalSurahCount,
      (index) => AudioSource.uri(
        Uri.parse(getAudioURLBySurah(index + 1)),
      ),
    ),
  );

  setAudioName(int index) {
    surahName = getSurahNameArabic(index);
    emit(SetAudioName());
  }

  setPlaylist(AudioPlayer player) async {
    emit(AudioLoading());
    try {
      await player.setLoopMode(LoopMode.all);
      await player.setAudioSource(
        playlist,
        initialIndex: 0,
      );
      emit(AudioSuccess());
    } on PlayerException catch (e) {
      emit(
        AudioFailed(
            errorMessage: 'No Internet Connection\nError Code: ${e.code}'),
      );
    } on Exception catch (e) {
      emit(
        AudioFailed(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  setVisible(bool visible) {
    isVisible = visible;
    emit(AudioBarVisible());
  }

  playAudio(AudioPlayer player, int audioIndex) async {
    emit(AudioLoading());
    try {
      await player.seek(Duration.zero, index: audioIndex);
      await player.play();
      emit(AudioSuccess());
    } on PlayerException catch (e) {
      emit(
        AudioFailed(
          errorMessage:
              'Connection Error Make Sure you Are Connected To The Internet And Try Again Later\nError Code:${e.code}',
        ),
      );
    } on Exception catch (e) {
      emit(AudioFailed(errorMessage: e.toString()));
    }
  }

  void listenToErrors(AudioPlayer player, BuildContext context) {
    player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace st) {
        if (e is PlatformException) {
          showErrorDialog(context, e.message ?? 'Internet Connection Lost');
        } else {
          showErrorDialog(context, e.toString());
        }
      },
    );
  }

  @override
  void onChange(Change<SurahStates> change) {
    log('current ${change.currentState.toString()}');
    log('next ${change.nextState.toString()}');
    super.onChange(change);
  }
}
