// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorText;
  AppError({this.errorText = ''});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorText,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
