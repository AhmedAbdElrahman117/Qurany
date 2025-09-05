import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/core/route_builder.dart';
import 'package:quran_app/features/azkar/presentation/view/azkar_view.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Azkar%20Cubit/azkar_cubit.dart';
import 'package:quran_app/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.data,
  });

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CustomAppBar(title: 'أذكار'),
        SliverList.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListItem(
                icon: FontAwesomeIcons.personPraying,
                title: data[index],
                onTap: () async {
                  await BlocProvider.of<AzkarCubit>(context).getAzkarByCategory(
                    category: data[index],
                  );
                  await Navigator.push(
                    context,
                    RouteBuilder().goto(AzkarView(category: data[index])),
                  );
                },
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}
