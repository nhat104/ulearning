import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/constants.dart';
import 'package:u_learning/common/widgets/toast.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/application/application_page.dart';
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

        if (email.isEmpty) {
          toastInfo(message: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          toastInfo(message: 'You need to fill password');
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {
            toastInfo(message: 'User does not exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(message: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, user.uid);
            if (!context.mounted) return;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ApplicationPage(),
              ),
            );
          } else {
            toastInfo(message: 'You are not an user of this app');
            return;
          }
        } on FirebaseAuthException catch (e) {
          debugPrint('error code ${e.code}');
          if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
            toastInfo(message: 'No user found for that email.');
          } else if (e.code == 'too-many-requests') {
            toastInfo(message: 'Too many requests. Try again later.');
          } else if (e.code == 'invalid-email') {
            toastInfo(message: 'Your email address appears to be malformed.');
          }
        }
      }
    } catch (e) {
      debugPrint('error $e');
    }
  }
}
