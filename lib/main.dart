import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_app/features/azkar/data/azkar_db.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Azkar%20Cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/view_model/Category%20Cubit/category_cubit.dart';
import 'package:quran_app/features/hadith/presentation/view_model/hadith_cubit/hadith_cubit.dart';
import 'package:quran_app/features/home/presentation/view/home_view.dart';
import 'package:quran_app/features/Player/Presentation/View_Model/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';
import 'package:quran_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await AzkarDB.databaseCrud.getDatabase();
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahCubit(),
        ),
        BlocProvider(
          create: (context) => HadithCubit(),
        ),
        BlocProvider(
          create: (context) => AzkarCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => TasbihCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(fontFamily: 'Amiri'),
        home: const HomeView(),
      ),
    );
  }
}
