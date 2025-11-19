import 'package:olearistest/core/network/failure.dart';

class ResponseImp<T> {
  ResponseImp.success({required this.result}) : failure = const Failure(Status.success);

  ResponseImp.failure(dynamic error)
      : failure = Failure.fromError(error),
        result = null;

  final Failure failure;
  final T? result;

  bool get isSuccess => failure.isOk;
}
