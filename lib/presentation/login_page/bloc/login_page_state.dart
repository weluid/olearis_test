part of 'login_page_cubit.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState.initial() = _Initial;

  const factory LoginPageState.loading() = _Loading;

  const factory LoginPageState.successLogin() = _SuccessLogin;

  const factory LoginPageState.failure(String errorText) = _Failure;
}
