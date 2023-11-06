import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/welcome/bloc/event.dart';
import 'package:u_learning/pages/welcome/bloc/state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState(page: 0)) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
