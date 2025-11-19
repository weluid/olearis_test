part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;

  const factory HomePageState.updateItems(List<String> items) = _UpdateItems;

  const factory HomePageState.loading() = _Loading;

  const factory HomePageState.failure(String errorText) = _Failure;
}
