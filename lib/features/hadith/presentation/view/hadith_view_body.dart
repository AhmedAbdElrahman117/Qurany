import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/fade_animation.dart';
import 'package:quran_app/features/hadith/presentation/view/widgets/hadith_item.dart';
import 'package:quran_app/features/hadith/presentation/view_model/hadith_cubit/hadith_cubit.dart';
import 'package:quran_app/features/hadith/presentation/view_model/hadith_cubit/hadith_states.dart';
import 'package:quran_app/features/quran/presentation/view/widgets/custom_app_bar.dart';

class HadithViewBody extends StatefulWidget {
  const HadithViewBody({super.key, required this.rawy, required this.rawyCode});

  final String rawy;
  final String rawyCode;

  @override
  State<HadithViewBody> createState() => _HadithViewBodyState();
}

class _HadithViewBodyState extends State<HadithViewBody> {
  final ScrollController controller = ScrollController();

  List<String> ahadith = [];

  int from = 1;
  int to = 20;

  @override
  Widget build(BuildContext context) {
    loadAhadith(context);
    return BlocConsumer<HadithCubit, HadithStates>(
      listener: (context, state) {
        if (state is HadithSuccess) {
          ahadith.addAll(state.ahadith);
        }
        if (state is HadithFailed) {
          showErrorDialog(context, state);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is HadithLoading,
          color: Colors.grey.shade300,
          progressIndicator: const CircularProgressIndicator(
            color: kTextColor,
          ),
          child: FadeAnimation(
            animationDuration: kDuration,
            begin: 0,
            end: 1,
            child: CustomScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomAppBar(title: widget.rawy),
                SliverList.builder(
                  itemCount: ahadith.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: HadithItem(text: ahadith[index]),
                    );
                  },
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
          ),
        );
      },
    );
  }

  void loadAhadith(BuildContext context) {
    from += 20;
    to += 20;
    return controller.addListener(
      () {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          BlocProvider.of<HadithCubit>(context).getAhadith(
            rawyCode: widget.rawyCode,
            from: from,
            to: to,
          );
        }
      },
    );
  }

  AwesomeDialog showErrorDialog(BuildContext context, HadithFailed state) {
    return AwesomeDialog(
      context: context,
      autoDismiss: true,
      customHeader: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/error.png'),
        ),
      ),
      animType: AnimType.scale,
      title: 'Error',
      titleTextStyle: const TextStyle(
        fontSize: 24,
        color: kTextColor,
      ),
      desc: state.errMessage,
      descTextStyle: const TextStyle(
        fontSize: 18,
        color: kTextColor,
      ),
      dialogBackgroundColor: kBackgroundColor,
      btnOkColor: kTextColor,
      buttonsTextStyle: const TextStyle(
        fontSize: 20,
        color: kBackgroundColor,
      ),
      onDismissCallback: (type) {
        if (type.name != 'btnOk') {
          Navigator.pop(context);
        }
      },
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    )..show();
  }
}
