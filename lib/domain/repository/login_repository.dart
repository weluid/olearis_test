import 'package:olearistest/core/network/response.dart';

abstract class LoginRepository {
  Future<ResponseImp<bool>> login({required String login, required String password});
}
