import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GlobalKeyModule {
  GlobalKey<NavigatorState> pref() => GlobalKey<NavigatorState>();
}
