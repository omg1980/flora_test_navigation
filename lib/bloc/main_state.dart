part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  const MainInitial();

  @override
  List<Object> get props => [];
}

class MainOpenSecondPage extends MainState {
  final Map<String, dynamic> data;

  const MainOpenSecondPage({required this.data});

  @override
  List<Object> get props => [Map<String, dynamic>];
}

class MainOpenThirdPage extends MainState {
  final Map<String, dynamic> data;

  const MainOpenThirdPage({required this.data});

  @override
  List<Object> get props => [Map<String, dynamic>];
}
