import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:olearistest/presentation/router/app_router.dart';

import 'core/theme/theme_light.dart';
import 'di/storage_injector.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurePresentationStorages();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
  // _configurePurchaseSdk();
}
//
// Future<void> _configurePurchaseSdk() async {
//   await Purchases.setLogLevel(LogLevel.debug);
//   PurchasesConfiguration? configuration;
//
//   if (Platform.isIOS) {
//     configuration = PurchasesConfiguration('appl_JGqnxaxnlaPFIUsZUEyNEOsjfKw');
//   } else if (Platform.isAndroid) {
//     configuration = PurchasesConfiguration('goog_NAiwUoLIycuOXVHCJerzanTastl');
//   }
//
//   if (configuration != null) {
//     await Purchases.configure(configuration);
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();


  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const [Locale('en')],
      theme: ThemeLight.light,
      routerConfig: _appRouter.config(),
    );
  }
}
