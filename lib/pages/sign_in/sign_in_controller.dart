import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {}
        if (password.isEmpty) {}

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {}
          if (credential.user!.emailVerified) {}

          var user = credential.user;
        } catch (e) {}
      }
    } catch (e) {}
  }
}
