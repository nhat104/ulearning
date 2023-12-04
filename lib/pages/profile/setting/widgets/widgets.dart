import 'package:flutter/material.dart';
import 'package:u_learning/common/widgets/base_text_widget.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: reusableText('Setting'),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
