import 'package:olearistest/core/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorage {
  SecureStorage(this._prefs);

  final FlutterSecureStorage _prefs;

  Future<bool> get hasToken async => await getToken() != null;

  Future<String?> getToken() async => await _prefs.read(key: Constants.accessToken);

  Future<void> setToken(String token) => _prefs.write(key: Constants.accessToken, value: token);

  Future<void> removeToken() async => await _prefs.delete(key: Constants.accessToken);
}
