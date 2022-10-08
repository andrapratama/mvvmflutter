// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';

class AppTitle extends StatelessWidget {
  final String? text;
  AppTitle({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
