import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/widgets/toast.dart';
import 'package:u_learning/pages/register/bloc/bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  void handleRegister() async {
    try {
      final state = context.read<RegisterBloc>().state;
      String username = state.username;
      String email = state.email;
      String password = state.password;
      String confirmPassword = state.confirmPassword;

      if (username.isEmpty) {
        toastInfo(message: 'You need to fill user name');
        return;
      }
      if (email.isEmpty) {
        toastInfo(message: 'You need to fill email address');
        return;
      }
      if (password.isEmpty) {
        toastInfo(message: 'You need to fill password');
        return;
      }
      if (confirmPassword.isEmpty) {
        toastInfo(message: 'You need to fill confirm password');
        return;
      }
      if (password != confirmPassword) {
        toastInfo(message: 'Password and confirm password are not match');
        return;
      }

      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(username);
          toastInfo(message: "An email has been sent to your email address");
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        print('error code ${e.code}');
        if (e.code == 'weak-password') {
          toastInfo(message: 'The password provided is too weak');
        } else if (e.code == 'too-many-requests') {
          toastInfo(message: 'Too many requests. Try again later');
        } else if (e.code == 'invalid-email') {
          toastInfo(message: 'Your email address appears to be malformed');
        } else if (e.code == 'email-already-in-use') {
          toastInfo(message: 'The account already exists for that email');
        } else {
          toastInfo(message: 'Something went wrong. Try again later');
        }
      }
    } catch (e) {}
  }
}
