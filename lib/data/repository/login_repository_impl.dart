import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:olearistest/core/network/response.dart';
import 'package:olearistest/domain/repository/login_repository.dart';

@LazySingleton(as: LoginRepository)
class AudioPlayerRepositoryImpl extends LoginRepository {
  AudioPlayerRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<ResponseImp<void>> login({required String login, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
