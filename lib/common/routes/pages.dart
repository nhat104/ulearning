import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/names.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/application/application_page.dart';
import 'package:u_learning/pages/application/bloc/bloc.dart';
import 'package:u_learning/pages/course_detail/bloc/bloc.dart';
import 'package:u_learning/pages/course_detail/course_detail.dart';
import 'package:u_learning/pages/home/bloc/bloc.dart';
import 'package:u_learning/pages/home/home_page.dart';
import 'package:u_learning/pages/profile/setting/bloc/bloc.dart';
import 'package:u_learning/pages/profile/setting/setting.dart';
import 'package:u_learning/pages/register/bloc/bloc.dart';
import 'package:u_learning/pages/register/register.dart';
import 'package:u_learning/pages/sign_in/bloc/bloc.dart';
import 'package:u_learning/pages/sign_in/sign_in.dart';
import 'package:u_learning/pages/welcome/bloc/bloc.dart';
import 'package:u_learning/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes = [
    PageEntity(
        route: AppRoutes.initial,
        page: const Welcome(),
        bloc: BlocProvider(create: (context) => WelcomeBloc())),
    PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(create: (context) => SignInBloc())),
    PageEntity(
        route: AppRoutes.register,
        page: const Register(),
        bloc: BlocProvider(create: (context) => RegisterBloc())),
    PageEntity(
      route: AppRoutes.application,
      page: const ApplicationPage(),
      bloc: BlocProvider(create: (context) => AppBloc()),
    ),
    PageEntity(
      route: AppRoutes.home,
      page: const HomePage(),
      bloc: BlocProvider(create: (context) => HomeBloc()),
    ),
    PageEntity(
      route: AppRoutes.courseDetail,
      page: const CourseDetailPage(),
      bloc: BlocProvider(create: (context) => CourseDetailBloc()),
    ),
    PageEntity(
      route: AppRoutes.setting,
      page: const SettingPage(),
      bloc: BlocProvider(create: (context) => SettingBloc()),
    ),
  ];

  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> providers = <dynamic>[];
    for (var element in routes) {
      if (element.bloc != null) {
        providers.add(element.bloc);
      }
    }
    return providers;
  }

  static MaterialPageRoute<dynamic> generateRouteSettings(
      RouteSettings settings) {
    PageEntity? pageEntity = routes.firstWhere(
      (element) {
        return element.route == settings.name;
      },
      orElse: () => PageEntity(route: '/sign_in', page: const SignIn()),
    );

    bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
    if (pageEntity.route == AppRoutes.initial && deviceFirstOpen) {
      bool isLogin = Global.storageService.getIsLogin();

      return MaterialPageRoute<dynamic>(
          builder: (context) =>
              isLogin ? const ApplicationPage() : const SignIn(),
          settings: settings);
    }
    return MaterialPageRoute<dynamic>(
        builder: (context) => pageEntity.page, settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
