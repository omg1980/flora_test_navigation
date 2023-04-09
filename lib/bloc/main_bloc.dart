import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainInitial()) {
    on<OpenSecondPage>(
      (event, emit) => emit(MainOpenSecondPage(data: event.data)),
    );

    on<OpenThirdPage>(
      (event, emit) => emit(MainOpenThirdPage(data: event.data)),
    );
  }
}
