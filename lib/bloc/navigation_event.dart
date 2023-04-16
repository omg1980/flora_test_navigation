part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
  @override
  List<Object> get props => [];
}

class MainPageNavigationEvent extends NavigationEvent {
  const MainPageNavigationEvent();
}

class SecondPageNavigationEvent extends NavigationEvent {
  final LogDataTypeTitle logPeriodType;

  const SecondPageNavigationEvent({required this.logPeriodType});

  @override
  List<Object> get props => [logPeriodType];
}

class ThirdPageNavigationEvent extends NavigationEvent {
  final LogDataTypeTitle logPeriodType;
  final int selectedYear;

  const ThirdPageNavigationEvent({
    required this.logPeriodType,
    required this.selectedYear,
  });

  @override
  List<Object> get props => [
        logPeriodType,
        selectedYear,
      ];
}
