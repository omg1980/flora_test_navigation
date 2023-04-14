part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  const MainInitial();

  @override
  List<Object> get props => [];
}

class MainOpenScreen extends MainState {
  final Map<String, dynamic> data;

  const MainOpenScreen({required this.data});

  @override
  List<Object> get props => [Map<String, dynamic>];
}
