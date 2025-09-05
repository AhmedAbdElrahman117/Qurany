import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_states.dart';

class CurrentTasbih extends StatelessWidget {
  const CurrentTasbih({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbihCubit, TasbihStates>(
      builder: (context, state) {
        return CurrentTasbihBackground(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${BlocProvider.of<TasbihCubit>(context).counter}',
              style: const TextStyle(
                fontSize: 28,
                color: kTextColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CurrentTasbihBackground extends StatelessWidget {
  const CurrentTasbihBackground({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: kTextColor,
          ),
        ),
      ),
      child: child,
    );
  }
}
