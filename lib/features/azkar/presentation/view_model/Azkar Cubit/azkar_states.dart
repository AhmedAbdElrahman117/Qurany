import 'package:quran_app/features/azkar/data/azkar_model.dart';

class AzkarStates {}

class AzkarInitial extends AzkarStates {}

class AzkarLoading extends AzkarStates {}

class AzkarFailed extends AzkarStates {
  final String errorMessage;

  AzkarFailed({required this.errorMessage});
}

class AzkarSuccess extends AzkarStates {
  final List<AzkarModel> azkar;

  AzkarSuccess({required this.azkar});
}
