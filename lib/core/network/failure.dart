import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Failure {
  const Failure(this.status, {this.errorMessages, this.errorMessage});

  factory Failure.fromError(dynamic error) {
    final (status, message, map) = _FailureHandler.handlerServerError(error);
    return Failure(
      status,
      errorMessage: message,
      errorMessages: map,
    );
  }

  final String? errorMessage;
  final Map? errorMessages;
  final Status status;

  bool get isOk => status == Status.success;

  @override
  String toString() {
    return 'Failure{errorMessage: $errorMessage, errorMessages: $errorMessages, status: $status}';
  }
}

enum Status {
  error,
  success,
  serverError,
  otherError,
  tokenError,
  phoneAlreadyUsed,
  internetError,
}

class _FailureHandler {
  static (Status, String?, Map<String, dynamic>? map) handlerServerError(
    Object? error,
  ) {
    try {
      if (error is DioException) {
        final response = error.response;
        final statusCode = response?.statusCode;

        if (response != null && statusCode != null) {
          if (statusCode >= 500 && statusCode < 600) {
            return (Status.serverError, null, null);
          }
          switch (response.statusCode) {
            case 500:
              return (Status.serverError, null, null);
            case 429:
              return (Status.serverError, response.data['message'], response.data);
            case 401:
              return (Status.serverError, response.data['message'], response.data);

            case 400:
              return (Status.serverError, response.data['message'], response.data);
            default:
              return (Status.otherError, response.data['message'], response.data);
          }
        } else if (error.error is SocketException) {
          return (Status.internetError, 'Lost connection', null);
        }
      } else {
        Logger().e(error);
      }
      return (Status.otherError, null, null);
    } catch (e) {
      return (Status.otherError, null, null);
    }
  }
}
