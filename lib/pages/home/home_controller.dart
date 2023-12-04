import 'package:flutter/material.dart';
import 'package:u_learning/common/entities/entities.dart';
import 'package:u_learning/global.dart';

class HomeController {
  final BuildContext context;
  UserItem userProfile = Global.storageService.getUserProfile();

  HomeController({required this.context});

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      // var result = await CourseApi
    }
  }
}
