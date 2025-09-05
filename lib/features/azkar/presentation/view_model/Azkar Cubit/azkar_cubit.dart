import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/azkar/data/azkar_db.dart';
import 'package:quran_app/features/azkar/data/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Azkar%20Cubit/azkar_states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit() : super(AzkarInitial());

  Future<void> getAzkarByCategory({required String category}) async {
    emit(AzkarLoading());
    try {
      List<AzkarModel> azkar =
          await AzkarDB.databaseCrud.getAzkarByCategory(category: category);
      emit(AzkarSuccess(azkar: azkar));
    } on Exception catch (e) {
      emit(AzkarFailed(errorMessage: e.toString()));
    }
  }
}
