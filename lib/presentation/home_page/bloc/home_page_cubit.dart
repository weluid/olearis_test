import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._items) : super(const HomePageState.initial());

  final List<String> _items;

  List<String> get items => _items;

  void addItem() {
    final index = _items.length;
    _items.add('Item $index');
    emit(HomePageState.updateItems(List.unmodifiable(_items)));
  }

  void removeItem() {
    if (_items.isNotEmpty) {
      _items.removeLast();
      emit(HomePageState.updateItems(List.unmodifiable(_items)));
    }
  }
}
