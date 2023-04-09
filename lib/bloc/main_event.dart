part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class OpenSecondPage extends MainEvent {
  final Map<String, dynamic> data;

  const OpenSecondPage({required this.data});

  @override
  List<Object> get props => [Map<String, dynamic>];
}

class OpenThirdPage extends MainEvent {
  final Map<String, dynamic> data;

  const OpenThirdPage({required this.data});

  @override
  List<Object> get props => [Map<String, dynamic>];
}
