
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharePrefModule {
  @preResolve
  Future<SharedPreferences> prefs() async => await SharedPreferences.getInstance();
}