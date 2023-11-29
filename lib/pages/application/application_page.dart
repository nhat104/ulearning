import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/application/bloc/bloc.dart';
import 'package:u_learning/pages/application/bloc/event.dart';
import 'package:u_learning/pages/application/bloc/state.dart';
import 'package:u_learning/pages/application/widgets/widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.currentIndex),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.w),
                    topRight: Radius.circular(20.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  onTap: (value) {
                    setState(() {
                      context.read<AppBloc>().add(TriggerAppEvent(value));
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.currentIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  // selectedItemColor: AppColors.primaryElement,
                  // unselectedItemColor: AppColors.primaryFourElementText,
                  elevation: 0,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
