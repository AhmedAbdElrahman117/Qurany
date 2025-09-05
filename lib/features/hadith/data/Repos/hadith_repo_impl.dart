import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/api_service.dart';
import 'package:quran_app/core/failure.dart';
import 'package:quran_app/features/hadith/data/Repos/hadith_repo.dart';

class HadithRepoImpl extends HadithRepo {
  @override
  Future<Either<List<String>, String>> getHadiths(
      String name, int from, int to) async {
    try {
      var response = await ApiService().get(
          link: 'https://api.hadith.gading.dev/books/$name?range=$from-$to');
      var data = response['data']['hadiths'];
      List<String> ahadith = [];

      for (int i = 0; i < data.length; i++) {
        ahadith.add(data[i]['arab']);
      }
      return left(ahadith);
    } on DioException catch (e) {
      ServerFailure dioError = ServerFailure(exception: e);
      return right(dioError.error());
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
