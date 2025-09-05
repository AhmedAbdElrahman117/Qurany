import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/azkar_model.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/hadith_item.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({
    super.key,
    required this.data,
    required this.category,
  });

  final List<AzkarModel> data;
  final String category;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomAppBar(title: category),
        SliverList.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: HadithItem(
                text: data[index].zekr,
                showConut: true,
                count: data[index].count,
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}
