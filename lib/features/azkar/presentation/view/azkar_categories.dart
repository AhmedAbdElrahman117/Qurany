import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/features/azkar/presentation/view/Widgets/category_list_view.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Category%20Cubit/category_cubit.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Category%20Cubit/category_states.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/loading.dart';

class AzkarCategories extends StatelessWidget {
  const AzkarCategories({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getAzkarCategories();
    return Scaffold(
      body: FadeAnimation(
        animationDuration: kDuration,
        begin: 0,
        end: 1,
        child: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            if (state is CategoryFailed) {
              return const Center(child: Text('No Data'));
            } else if (state is CategorySuccess) {
              return CategoryListView(data: state.categories);
            } else {
              return const Loading();
            }
          },
        ),
      ),
    );
  }
}
