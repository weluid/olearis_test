import 'package:olearistest/di/storage_injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configurePresentationStorages() async => await getIt.init();