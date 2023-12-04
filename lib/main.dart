import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/global.dart';

import 'common/routes/routes.dart';
import 'common/values/colors.dart';

void main() async {
  await Global.init();
  // EasyLoading.instance
  //   ..displayDuration = const Duration(milliseconds: 2000)
  //   ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  //   ..loadingStyle = EasyLoadingStyle.dark
  //   ..indicatorSize = 45.0
  //   ..radius = 10.0
  //   ..progressColor = Colors.yellow
  //   ..backgroundColor = Colors.green
  //   ..indicatorColor = Colors.yellow
  //   ..textColor = Colors.yellow
  //   ..maskColor = Colors.blue.withOpacity(0.5)
  //   ..userInteractions = true
  //   ..dismissOnTap = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
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
          builder: EasyLoading.init(),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
