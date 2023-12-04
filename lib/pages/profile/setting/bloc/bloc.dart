import 'package:flutter_bloc/flutter_bloc.dart';

import './event.dart';
import './state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<TriggerSetting>(((event, emit) {
      emit(const SettingState());
    }));
  }
}
