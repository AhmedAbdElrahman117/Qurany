import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/azkar/data/azkar_db.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Category%20Cubit/category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getAzkarCategories() async {
    emit(CategoryLoading());
    try {
      List<String> categories = await AzkarDB.databaseCrud.getAzkarCategories();
      emit(CategorySuccess(categories: categories));
    } on Exception catch (e) {
      emit(CategoryFailed(errorMessage: e.toString()));
    }
  }
}
