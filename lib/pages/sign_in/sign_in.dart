import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/constants.dart';
import 'package:u_learning/common/widgets/app_bar.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/application/application_page.dart';
import 'package:u_learning/pages/sign_in/bloc/bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/event.dart';
import 'package:u_learning/pages/sign_in/bloc/state.dart';
import 'package:u_learning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            appBar: buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 40.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address",
                            'email',
                            'user',
                            (value) => context
                                .read<SignInBloc>()
                                .add(EmailEvent(value))),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your password",
                            'password',
                            'lock',
                            (value) => context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value))),
                        forgotPassword(),
                        buildLoginAndRegButton('Log In', 'login', () {
                          Global.storageService.setString(
                              AppConstants.STORAGE_USER_TOKEN_KEY, 'user.uid');
                          Global.storageService.setString(
                              AppConstants.STORAGE_USER_PROFILE_KEY,
                              'user.toString()');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ApplicationPage(),
                            ),
                          );
                          // SignInController(context: context)
                          //     .handleSignIn('email');
                        }),
                        buildLoginAndRegButton('Sign Up', 'resgister', () {
                          Navigator.pushNamed(context, '/register');
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
