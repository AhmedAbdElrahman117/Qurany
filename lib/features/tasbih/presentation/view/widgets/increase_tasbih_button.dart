import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';

class IncreaseTasbihButton extends StatelessWidget {
  const IncreaseTasbihButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<TasbihCubit>(context).counterIncrease();
      },
      child: null,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 110),
        backgroundColor: kTextColor,
        shape: const CircleBorder(
          side: BorderSide(
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
