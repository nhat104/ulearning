import 'package:flutter_bloc/flutter_bloc.dart';

import './event.dart';
import './state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeDots>((HomeDots event, Emitter<HomeState> emit) =>
        emit(state.copyWith(index: event.index)));
  }
}
