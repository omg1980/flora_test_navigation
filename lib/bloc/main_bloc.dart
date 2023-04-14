import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GlobalKey<NavigatorState> navigatorKey;
  MainBloc({required this.navigatorKey}) : super(const MainInitial()) {
    on<NavigateToScreen>((event, emit) {
      navigatorKey.currentState?.pushNamed(event.namedRoute);
      emit(const MainInitial());
      emit(MainOpenScreen(data: event.data));
    });
  }
}
