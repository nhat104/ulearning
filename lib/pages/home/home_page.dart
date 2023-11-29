import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/home/bloc/bloc.dart';
import 'package:u_learning/pages/home/bloc/state.dart';
import 'package:u_learning/pages/home/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageText('Hello', color: AppColors.primaryThreeElementText),
                homePageText('NhatMM', top: 5),
                20.verticalSpace,
                searchView(),
                sliderView(context, state),
                menuView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
