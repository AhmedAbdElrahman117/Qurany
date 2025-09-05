import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/core/category_model.dart';
import 'package:quran_app/features/Player/Presentation/View/listen_view.dart';
import 'package:quran_app/features/agza/Presentation/View/agza_view.dart';
import 'package:quran_app/features/azkar/presentation/view/azkar_categories.dart';
import 'package:quran_app/features/hadith/presentation/view/hadith_categories.dart';
import 'package:quran_app/features/quran/presentation/view/quran_categories.dart';
import 'package:quran_app/features/quran/presentation/view/quran_view.dart';
import 'package:quran_app/features/tasbih/presentation/view/tasbih_view.dart';

const Color kBackgroundColor = Color(0xFFFEEBDD);

const Color kAppBarColor = Color.fromARGB(255, 250, 214, 188);

const Color kTextColor = Color(0xFFA5583A);

const Duration kDuration = Duration(milliseconds: 1000);

const List<CategoryModel> appCategories = [
  CategoryModel(
    option: QuranCategories(),
    title: 'القرءان الكريم',
    icon: FontAwesomeIcons.bookQuran,
  ),
  CategoryModel(
    option: HadithCategories(),
    title: 'احاديث',
    icon: Icons.mosque,
  ),
  CategoryModel(
    option: AzkarCategories(),
    title: 'أذكار',
    icon: FontAwesomeIcons.personPraying,
  ),
  CategoryModel(
    option: TasbihView(),
    title: 'سبحة',
    icon: Icons.timer,
  ),
];

const List<CategoryModel> quranCategories = [
  CategoryModel(
    option: QuranView(),
    title: 'سور',
    icon: FontAwesomeIcons.bookQuran,
  ),
  CategoryModel(
    option: AgzaView(),
    title: 'اجزاء',
    icon: FontAwesomeIcons.book,
  ),
  CategoryModel(
    option: ListenView(),
    title: 'أستماع',
    icon: FontAwesomeIcons.volumeHigh,
  ),
];

Map<String, String> rawytitles = {
  'bukhari': 'رواه البخاري',
  'muslim': 'رواه مسلم',
  'tirmidzi': 'رواه الترمذي',
  'malik': 'رواه مالك',
  'abu-daud': 'رواه ابو داود',
  'ahmad': 'رواه أحمد',
  'darimi': 'رواه الدرامي',
  'ibnu-majah': 'رواه ابن ماجه',
  'nasai': 'رواه نسائي',
};

AwesomeDialog showErrorDialog(BuildContext context, String errorMessage) {
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
    desc: errorMessage,
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
