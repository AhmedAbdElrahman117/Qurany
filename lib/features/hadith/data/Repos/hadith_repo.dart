import 'package:dartz/dartz.dart';

abstract class HadithRepo {
  Future<Either<List<String>, String>> getHadiths(
      String name, int from, int to);
}
