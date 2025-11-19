import 'package:olearistest/data/database/local_storage.dart';
import 'package:olearistest/di/storage_injector.dart';
import 'package:olearistest/generated/assets.gen.dart';
import 'package:olearistest/presentation/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:olearistest/presentation/router/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([Future.delayed(const Duration(seconds: 1))]),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Assets.logo.svg();

          context.router.replaceAll([const LoginRoute()]);
        }
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          // child: Assets.images.logo.image(height: MediaQuery.of(context).size.width * 0.2),
        ),
      ),
    );
  }
}
