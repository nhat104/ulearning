import 'package:flutter_bloc/flutter_bloc.dart';

import './event.dart';
import './state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(currentIndex: event.index));
    });
  }
}
