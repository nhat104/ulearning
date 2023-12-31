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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: homePageText(
                  'Hello',
                  color: AppColors.primaryThreeElementText,
                )),
                SliverToBoxAdapter(child: homePageText('NhatMM', top: 5)),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: sliderView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 4,
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/course_detail');
                          },
                          child: courseGrid(),
                        ),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
