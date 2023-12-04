import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/routes/routes.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reusableText('Profile'),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditBtn() {
  return Container(
    width: 80.w,
    height: 80.h,
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
      ),
    ),
    child: Image(
      image: const AssetImage('assets/icons/edit_3.png'),
      width: 25.w,
      height: 25.h,
    ),
  );
}

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.setting,
            // arguments: imagesInfo.keys.elementAt(index),
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Image.asset(
                      'assets/icons/${imagesInfo.values.elementAt(index)}'),
                ),
                15.horizontalSpace,
                reusableText(imagesInfo.keys.elementAt(index)),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};
