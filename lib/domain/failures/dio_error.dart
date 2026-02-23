import 'package:dio/dio.dart';

String handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout. Please try again.';
    case DioExceptionType.sendTimeout:
      return 'Request timeout. Please try again.';
    case DioExceptionType.receiveTimeout:
      return 'Server took too long to respond.';
    case DioExceptionType.connectionError:
      return 'No internet connection.';
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final message =
          e.response?.data?['detail'] ??
          e.response?.data?['message'] ??
          'Server error';

      return '[$statusCode] $message';

    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    case DioExceptionType.unknown:
      return 'No internet connection.';
    default:
      return 'Something went wrong.';
  }
}
