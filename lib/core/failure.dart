import 'package:dio/dio.dart';

class ServerFailure {
  final DioException exception;

  ServerFailure({required this.exception});

  String error() {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection Timeout Try Again Later';
      case DioExceptionType.sendTimeout:
        return 'Send Timeout Try Again Later';
      case DioExceptionType.receiveTimeout:
        return 'Receive Timeout Try Again Later';
      case DioExceptionType.badCertificate:
        return 'Website Certificate is Bad Contact Support To Solve The Issue';
      case DioExceptionType.badResponse:
        return 'Bad Response Try Again Later OR Contact Support';
      case DioExceptionType.cancel:
        return 'Connection Cancelled';
      case DioExceptionType.connectionError:
        return 'No Internet Connection \nConnect To Internet And Try Again';
      case DioExceptionType.unknown:
        return 'Unknown Error Try Again Later';
    }
  }
}
