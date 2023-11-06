import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(
                  child: reuseableText("Or use your email account to login")),
              Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reuseableText("Email"),
                    SizedBox(height: 5.h),
                    buildTextField("Enter your email address", 'email', 'user'),
                    reuseableText("Password"),
                    SizedBox(height: 5.h),
                    buildTextField("Enter your password", 'password', 'lock'),
                    forgotPassword(),
                    buildLoginAndRegButton('Log In', 'login'),
                    buildLoginAndRegButton('Register', 'resgister'),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
