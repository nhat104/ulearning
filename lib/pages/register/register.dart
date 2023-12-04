import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/widgets/index.dart';
import 'package:u_learning/pages/register/bloc/bloc.dart';
import 'package:u_learning/pages/register/bloc/event.dart';
import 'package:u_learning/pages/register/bloc/state.dart';
import 'package:u_learning/pages/register/register_controller.dart';
import 'package:u_learning/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            appBar: buildAppBar('Sign Up'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 40.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Username"),
                        buildTextField(
                            "Enter your user name",
                            'text',
                            'user',
                            (value) => context
                                .read<RegisterBloc>()
                                .add(UsernameEvent(value))),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address",
                            'email',
                            'user',
                            (value) => context
                                .read<RegisterBloc>()
                                .add(EmailEvent(value))),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your Password",
                            'password',
                            'lock',
                            (value) => context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value))),
                        reusableText("Confirm Password"),
                        buildTextField(
                            "Enter your Confirm Password",
                            'password',
                            'lock',
                            (value) => context
                                .read<RegisterBloc>()
                                .add(ConfirmPasswordEvent(value))),
                        reusableText(
                            "By creating an account you agree with our them & condication"),
                        buildLoginAndRegButton('Sign Up', 'login', () {
                          RegisterController(context: context).handleRegister();
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
