import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/routes/names.dart';
import 'package:u_learning/common/values/constants.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/application/bloc/bloc.dart';
import 'package:u_learning/pages/application/bloc/event.dart';
import 'package:u_learning/pages/home/bloc/bloc.dart';
import 'package:u_learning/pages/home/bloc/event.dart';
import 'package:u_learning/pages/profile/setting/widgets/widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    void logout() {
      Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
      context.read<AppBloc>().add(const TriggerAppEvent(0));
      context.read<HomeBloc>().add(const HomeDots(0));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
    }

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                logout();
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) => AlertDialog(
                //     title: const Text('Confirm logout'),
                //     content: const Text('Confirm logout'),
                //     actions: [
                //       TextButton(
                //         onPressed: () => Navigator.of(context).pop(),
                //         child: const Text('Cancel'),
                //       ),
                //       TextButton(
                //         onPressed: logout,
                //         child: const Text('Confirm'),
                //       ),
                //     ],
                //   ),
                // );
              },
              child: Container(
                height: 100.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Logout.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
