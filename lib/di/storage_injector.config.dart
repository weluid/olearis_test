// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/cupertino.dart' as _i719;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:olearistest/data/database/local_storage.dart' as _i899;
import 'package:olearistest/data/database/secure_storage.dart' as _i700;
import 'package:olearistest/data/repository/login_repository_impl.dart' as _i86;
import 'package:olearistest/di/modules/dio_module.dart' as _i961;
import 'package:olearistest/di/modules/global_key_module.dart' as _i509;
import 'package:olearistest/di/modules/secure_pref_module.dart' as _i929;
import 'package:olearistest/di/modules/share_pref_module.dart' as _i44;
import 'package:olearistest/domain/repository/login_repository.dart' as _i975;
import 'package:olearistest/presentation/router/app_router.dart' as _i539;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final securePrefModule = _$SecurePrefModule();
    final globalKeyModule = _$GlobalKeyModule();
    final sharePrefModule = _$SharePrefModule();
    final registerModule = _$RegisterModule();
    gh.factory<_i558.FlutterSecureStorage>(() => securePrefModule.prefs());
    gh.factory<_i719.GlobalKey<_i719.NavigatorState>>(
      () => globalKeyModule.pref(),
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharePrefModule.prefs(),
      preResolve: true,
    );
    gh.singleton<_i899.LocalStorage>(
      () => _i899.LocalStorage(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i700.SecureStorage>(
      () => _i700.SecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i539.AppRouter>(
      () => _i539.AppRouter(gh<_i409.GlobalKey<_i409.NavigatorState>>()),
    );
    await gh.factoryAsync<_i361.Dio>(
      () => registerModule.pref(gh<_i700.SecureStorage>()),
      preResolve: true,
    );
    gh.lazySingleton<_i975.LoginRepository>(
      () => _i86.AudioPlayerRepositoryImpl(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$SecurePrefModule extends _i929.SecurePrefModule {}

class _$GlobalKeyModule extends _i509.GlobalKeyModule {}

class _$SharePrefModule extends _i44.SharePrefModule {}

class _$RegisterModule extends _i961.RegisterModule {}
