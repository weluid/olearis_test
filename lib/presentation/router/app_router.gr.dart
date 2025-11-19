// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:collection/collection.dart' as _i6;
import 'package:flutter/material.dart' as _i5;
import 'package:olearistest/presentation/home_page/home_page.dart' as _i1;
import 'package:olearistest/presentation/login_page/login_page.dart' as _i2;
import 'package:olearistest/presentation/splash_page/splash_page.dart' as _i3;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i5.Key? key,
    required List<String> items,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, items: items),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i1.HomePage(key: args.key, items: args.items);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.items});

  final _i5.Key? key;

  final List<String> items;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, items: $items}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key &&
        const _i6.ListEquality().equals(items, other.items);
  }

  @override
  int get hashCode => key.hashCode ^ const _i6.ListEquality().hash(items);
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i3.SplashPage());
    },
  );
}
