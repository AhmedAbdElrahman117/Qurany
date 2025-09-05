class HadithStates {}

class HadithInitial extends HadithStates {}

class HadithLoading extends HadithStates {}

class HadithSuccess extends HadithStates {
  final List<String> ahadith;

  HadithSuccess(this.ahadith);
}

class HadithFailed extends HadithStates {
  final String errMessage;

  HadithFailed(this.errMessage);
}
