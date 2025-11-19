import 'package:olearistest/core/utils/constants.dart';
import 'package:olearistest/data/database/local_storage.dart';
import 'package:olearistest/di/storage_injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState.initial());

}
