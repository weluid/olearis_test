import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:olearistest/di/storage_injector.dart';
import 'package:olearistest/domain/repository/login_repository.dart';
import 'package:olearistest/generated/assets.gen.dart';
import 'package:olearistest/presentation/login_page/bloc/login_page_cubit.dart';
import 'package:olearistest/presentation/router/app_router.gr.dart';
import 'package:olearistest/presentation/widgets/common_appbar.dart';
import 'package:olearistest/presentation/widgets/common_button.dart';
import 'package:olearistest/presentation/widgets/common_circular_indicator.dart';
import 'package:olearistest/presentation/widgets/common_fullscreen_loader.dart';
import 'package:olearistest/presentation/widgets/common_text_field.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FullscreenLoaderMixin {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _credentialNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_validate);
    _passwordController.addListener(_validate);
  }

  void _validate() {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();
    final continueValue = login.isNotEmpty && password.isNotEmpty;

    _credentialNotifier.value = continueValue;
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _credentialNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final typography = context.typography;

    return BlocProvider(
      create: (context) => LoginPageCubit(getIt<LoginRepository>()),
      child: BlocConsumer<LoginPageCubit, LoginPageState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            successLogin: () {
              context.pushRoute(HomeRoute());
            },
          );
        },
        builder: (context, state) {
          final showLoader = state.maybeWhen(orElse: () => false, loading: () => true);

          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: CommonAppBar(textTitle: l10n.signIn),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
                  final logoVerticalPadding = isPortrait ? constraints.maxHeight * 0.15 : 12.0;
                  final logoWidth = isPortrait ? constraints.maxWidth : constraints.maxWidth * 0.45;
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: 16,
                      top: logoVerticalPadding,
                      right: 16,
                      bottom: 16,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - logoVerticalPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Assets.logo.svg(width: logoWidth),
                              SizedBox(height: logoVerticalPadding),
                              CommonTextField.primary(
                                label: l10n.login,
                                controller: _loginController,
                              ),
                              const SizedBox(height: 8),
                              CommonTextField.primary(
                                label: l10n.password,
                                controller: _passwordController,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ValueListenableBuilder<bool>(
                            valueListenable: _credentialNotifier,
                            builder: (context, isActive, _) {
                              return SizedBox(
                                width: 100,
                                child: CommonButton.primary(
                                  onPressed: isActive
                                      ? () {
                                          context.read<LoginPageCubit>().login(
                                            login: _loginController.text,
                                            password: _passwordController.text,
                                          );
                                        }
                                      : null,
                                  label: '',
                                  child: showLoader
                                      ? CommonCircularIndicator()
                                      : Text(
                                          l10n.continueTitle,
                                          style: typography.bodySmall?.copyWith(
                                            color: isActive ? Colors.white : null,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
