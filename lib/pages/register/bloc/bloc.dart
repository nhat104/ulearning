import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/register/bloc/event.dart';
import 'package:u_learning/pages/register/bloc/state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UsernameEvent>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
  }
}
