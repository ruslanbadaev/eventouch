import 'package:dio/dio.dart';

class AppErrors {
  static String parseNetworkError(DioError error) {
    try {
      String errorText = error.message;
      if (error.message.toUpperCase().contains('CONNECTION REFUSED')) {
        return 'CONNECTION_REFUSED';
      }
      return errorText;
    } catch (e) {
      return error.message;
    }
  }
}
