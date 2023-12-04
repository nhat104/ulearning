import 'package:flutter/material.dart';
import 'package:u_learning/common/entities/user.dart';
import 'package:u_learning/common/utils/http.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post('auth/login',
        data: params?.toJson(), queryParams: params?.toJson());
    // var response = await HttpUtil().get('users/1');

    debugPrint('response: $response');
  }
}
