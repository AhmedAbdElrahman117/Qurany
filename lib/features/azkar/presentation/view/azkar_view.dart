import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/features/azkar/presentation/view/Widgets/azkar_list_view.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Azkar%20Cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Azkar%20Cubit/azkar_states.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/loading.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AzkarCubit, AzkarStates>(
        builder: (context, state) {
          if (state is AzkarFailed) {
            return const Center(child: Text('No Data'));
          } else if (state is AzkarSuccess) {
            return FadeAnimation(
              animationDuration: kDuration,
              begin: 0,
              end: 1,
              child: AzkarListView(
                data: state.azkar,
                category: category,
              ),
            );
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
