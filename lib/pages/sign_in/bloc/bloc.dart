import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/event.dart';
import 'package:u_learning/pages/sign_in/bloc/state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
