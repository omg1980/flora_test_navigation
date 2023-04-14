part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class NavigateToScreen extends MainEvent {
  final Map<String, dynamic> data;
  final String namedRoute;

  const NavigateToScreen({required this.namedRoute, required this.data});

  @override
  List<Object> get props => [Map<String, dynamic>];
}
