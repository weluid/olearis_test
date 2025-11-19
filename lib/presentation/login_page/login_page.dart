import 'package:auto_route/auto_route.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:olearistest/presentation/widgets/common_appbar.dart';
import 'package:olearistest/presentation/widgets/common_fullscreen_loader.dart';
import 'package:flutter/material.dart';
import 'package:olearistest/presentation/widgets/common_text_field.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FullscreenLoaderMixin {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(appBar: CommonAppBar(textTitle: "Sign In"));
  }
}
