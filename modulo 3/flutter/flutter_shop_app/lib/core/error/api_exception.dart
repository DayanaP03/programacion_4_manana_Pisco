import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  factory ApiException.fromDioError(DioException e) {
    final code = e.response?.statusCode;
    final data = e.response?.data;

    String message = 'Unexpected network error';

    if (data is Map<String, dynamic>) {
      final detail = data['detail'];
      final error = data['error'];
      final messageField = data['message'];

      if (detail is String && detail.isNotEmpty) {
        message = detail;
      } else if (error is String && error.isNotEmpty) {
        message = error;
      } else if (messageField is String && messageField.isNotEmpty) {
        message = messageField;
      }
    } else if (data is String && data.isNotEmpty) {
      message = data;
    }

    message = switch (e.type) {
      DioExceptionType.connectionTimeout => 'Connection timeout',
      DioExceptionType.sendTimeout => 'Request timeout',
      DioExceptionType.receiveTimeout => 'Response timeout',
      DioExceptionType.transformTimeout => 'Response parsing timeout',
      DioExceptionType.connectionError => 'No internet connection',
      DioExceptionType.cancel => 'Request cancelled',
      DioExceptionType.badCertificate => 'Invalid server certificate',
      DioExceptionType.badResponse => message,
      DioExceptionType.unknown => e.message ?? message,
    };

    return ApiException(message, statusCode: code);
  }

  @override
  String toString() {
    if (statusCode == null) return message;
    return '[$statusCode] $message';
  }
}
