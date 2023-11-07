import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/register/bloc/bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/bloc.dart';
import 'package:u_learning/pages/welcome/bloc/bloc.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        // Add all your bloc providers here.
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
      ];
}
