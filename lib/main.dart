import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/bloc_provider.dart';
import 'package:u_learning/pages/register/register.dart';
import 'package:u_learning/pages/sign_in/sign_in.dart';
import 'package:u_learning/pages/welcome/welcome.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          home: const Welcome(),
          routes: {
            '/signIn': (context) => const SignIn(),
            '/register': (context) => const Register(),
          },
        ),
      ),
    );
  }
}
