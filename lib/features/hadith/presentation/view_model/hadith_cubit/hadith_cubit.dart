import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/hadith/data/Repos/hadith_repo.dart';
import 'package:quran_app/features/hadith/data/Repos/hadith_repo_impl.dart';
import 'package:quran_app/features/hadith/presentation/view_model/hadith_cubit/hadith_states.dart';

class HadithCubit extends Cubit<HadithStates> {
  HadithCubit() : super(HadithInitial());

  HadithRepo repo = HadithRepoImpl();

  void getAhadith(
      {required String rawyCode, required int from, required int to}) async {
    emit(HadithLoading());

    var ahadith = await repo.getHadiths(rawyCode, from, to);

    ahadith.fold(
      (ahadiths) => emit(HadithSuccess(ahadiths)),
      (error) => emit(HadithFailed(error.toString())),
    );
  }
}
