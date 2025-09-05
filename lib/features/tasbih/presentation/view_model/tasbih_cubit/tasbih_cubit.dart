import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_states.dart';

class TasbihCubit extends Cubit<TasbihStates> {
  TasbihCubit() : super(TasbihInitial());

  final box = GetStorage();

  int counter = 0;

  int total = 0;

  void counterInit() {
    total = box.read('totalcounter') ?? 0;
  }

  void counterIncrease() {
    box.write('totalcounter', ++total);
    ++counter;
    emit(TasbihIncreased());
  }

  void counterClear() {
    counter = 0;
    emit(TasbihClear());
  }
}
