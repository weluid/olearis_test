import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olearistest/domain/repository/login_repository.dart';

part 'login_page_state.dart';

part 'login_page_cubit.freezed.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this._repository) : super(const LoginPageState.initial());

  final LoginRepository _repository;

  void login({required String login, required String password}) async {
    emit(LoginPageState.loading());
    final result = await _repository.login(login: login, password: password);

    if (result.isSuccess) {
      emit(LoginPageState.successLogin());
    }  else {
      emit(LoginPageState.failure("error"));
    }
  }
}
