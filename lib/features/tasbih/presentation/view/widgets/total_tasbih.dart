import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_states.dart';

class TotalTasbih extends StatelessWidget {
  const TotalTasbih({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbihCubit, TasbihStates>(
      builder: (context, state) {
        return Text(
          'مجموع التسبيحات: ${BlocProvider.of<TasbihCubit>(context).total}',
          style: const TextStyle(
            fontSize: 20,
            color: kTextColor,
          ),
        );
      },
    );
  }
}
