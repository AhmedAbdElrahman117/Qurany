import 'package:flutter/material.dart';
import 'package:quran_app/features/tasbih/presentation/view/widgets/clear_tasbih_button.dart';
import 'package:quran_app/features/tasbih/presentation/view/widgets/current_tasbih.dart';
import 'package:quran_app/features/tasbih/presentation/view/widgets/increase_tasbih_button.dart';
import 'package:quran_app/features/tasbih/presentation/view/widgets/total_tasbih.dart';

class TasbihViewBody extends StatelessWidget {
  const TasbihViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: CurrentTasbih(),
        ),
        TotalTasbih(),
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: ClearTasbihButton(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: IncreaseTasbihButton(),
        ),
      ],
    );
  }
}
