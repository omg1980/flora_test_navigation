import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitialState()) {
    on<MainPageNavigationEvent>(
      (event, emit) => emit(const NavigationInitialState()),
    );

    on<SecondPageNavigationEvent>(
      (event, emit) => emit(
        SecondPageNavigationState(
          logPeriodType: event.logPeriodType,
        ),
      ),
    );

    on<ThirdPageNavigationEvent>(
      (event, emit) => emit(
        ThirdPageNavigationState(
          logPeriodType: event.logPeriodType,
          selectedYear: event.selectedYear,
        ),
      ),
    );
  }

  /// don't call add() directly in the code. It would confuse you in the future!
  void openChoiceScreen() => add(const MainPageNavigationEvent());

  void openDateSelectionScreen(LogDataTypeTitle logPeriodType) => add(
        SecondPageNavigationEvent(
          logPeriodType: logPeriodType,
        ),
      );

  void openResultScreen(LogDataTypeTitle logPeriodType, int selectedYear) =>
      add(
        ThirdPageNavigationEvent(
          logPeriodType: logPeriodType,
          selectedYear: selectedYear,
        ),
      );
}
