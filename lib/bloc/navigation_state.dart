part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationInitialState extends NavigationState {
  const NavigationInitialState();

  @override
  List<Object> get props => [];
}

class SecondPageNavigationState extends NavigationState {
  final LogDataTypeTitle logPeriodType;

  const SecondPageNavigationState({required this.logPeriodType});

  @override
  List<Object> get props => [logPeriodType];
}

class ThirdPageNavigationState extends NavigationState {
  final LogDataTypeTitle logPeriodType;
  final int selectedYear;

  const ThirdPageNavigationState({
    required this.logPeriodType,
    required this.selectedYear,
  });

  Map<String, String> toMap() => {
        'logPeriodType': logPeriodType.getTextValue(),
        'selectedYear': selectedYear.toString(),
      };

  @override
  List<Object> get props => [
        logPeriodType,
        selectedYear,
      ];
}

enum LogDataTypeTitle { period, getPregnant }

extension DataTypeExtensions on LogDataTypeTitle {
  String getTextValue() {
    switch (this) {
      case LogDataTypeTitle.period:
        return 'Track my period';

      case LogDataTypeTitle.getPregnant:
        return 'Get pregnant';
    }
  }
}
