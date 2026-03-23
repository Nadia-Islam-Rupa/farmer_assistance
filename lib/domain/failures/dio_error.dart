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
      final detail =
          e.response?.data?['detail'] ?? e.response?.data?['message'] ?? '';

      // Handle specific status codes from backend
      switch (statusCode) {
        case 400:
          return detail.isNotEmpty
              ? detail
              : 'Invalid request. Please check your message and try again.';
        case 503:
          return detail.isNotEmpty
              ? 'Service temporarily unavailable: $detail'
              : 'The AI service is temporarily unavailable. Please try again later.';
        case 500:
          return detail.isNotEmpty
              ? 'Server error: $detail'
              : 'An internal server error occurred. Please try again.';
        case 401:
          return 'Authentication failed. Please log in again.';
        case 403:
          return 'Access denied. You don\'t have permission to perform this action.';
        case 404:
          return 'Requested service not found. Please check your configuration.';
        case 429:
          return 'Too many requests. Please wait a moment before trying again.';
        default:
          return detail.isNotEmpty
              ? '[$statusCode] $detail'
              : 'Server error [$statusCode]. Please try again.';
      }

    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    case DioExceptionType.unknown:
      return 'No internet connection.';
    default:
      return 'Something went wrong.';
  }
}
