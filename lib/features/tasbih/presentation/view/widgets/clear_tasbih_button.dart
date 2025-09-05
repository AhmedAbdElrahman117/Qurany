import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';

class ClearTasbihButton extends StatelessWidget {
  const ClearTasbihButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<TasbihCubit>(context).counterClear();
        },
        child: null,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(
            side: BorderSide(
              color: kTextColor,
            ),
          ),
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.18,
            MediaQuery.of(context).size.height * 0.08,
          ),
        ),
      ),
    );
  }
}
