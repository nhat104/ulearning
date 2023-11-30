import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/home/bloc/bloc.dart';
import 'package:u_learning/pages/home/bloc/event.dart';
import 'package:u_learning/pages/home/bloc/state.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                image: const DecorationImage(
                  image: AssetImage('assets/icons/person.png'),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: SizedBox(
                width: 16.w,
                height: 16.h,
                child: Image.asset('assets/icons/search.png'),
              ),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // onChanged: onChanged,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'search your course',
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  color: AppColors.primaryText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
                autocorrect: false,
                // obscureText: textType == 'password' ? true : false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) =>
              context.read<HomeBloc>().add(HomeDots(value)),
          children: [
            _sliderContainer(path: 'assets/icons/Art.png'),
            _sliderContainer(path: 'assets/icons/Image(1).png'),
            _sliderContainer(path: 'assets/icons/Image(2).png'),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _sliderContainer({required String path}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(
        image: AssetImage(path),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableSubtitleText('Choose your course'),
            GestureDetector(
              child: _reusableSubtitleText('See all',
                  color: AppColors.primaryThreeElementText, fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuText('All'),
            _reusableMenuText(
              'Popular',
              textColor: AppColors.primaryThreeElementText,
              bgColor: Colors.white,
            ),
            _reusableMenuText(
              'Newest',
              textColor: AppColors.primaryThreeElementText,
              bgColor: Colors.white,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableSubtitleText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    ),
  );
}

Widget _reusableMenuText(String text,
    {Color textColor = AppColors.primaryElementText,
    Color bgColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: bgColor),
    ),
    child: _reusableSubtitleText(
      text,
      color: textColor,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        image: AssetImage('assets/icons/Image(1).png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'English',
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Flutter',
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontSize: 8.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
