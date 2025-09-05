import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/features/tasbih/presentation/view/widgets/tasbih_view_body.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TasbihCubit>(context).counterInit();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTextColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: const BackButton(),
        foregroundColor: Colors.white,
        title: const Text(
          'سبحة',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: const FadeAnimation(
        animationDuration: kDuration,
        begin: 0,
        end: 1,
        child: TasbihViewBody(),
      ),
    );
  }
}
