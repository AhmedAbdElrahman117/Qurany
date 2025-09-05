class SurahStates {}

class SurahInitial extends SurahStates {}

class AudioFailed extends SurahStates {
  final String errorMessage;

  AudioFailed({required this.errorMessage});
}

class AudioLoading extends SurahStates {}

class SetAudioName extends SurahStates {}

class AudioSuccess extends SurahStates {}

class AudioBarVisible extends SurahStates {}
