// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mvvm/components/app_title.dart';
import 'package:mvvm/users_list/models/users_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final onTap;
  const UserListRow({required this.userModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userModel.name,
            ),
            Text(userModel.email.toString(),
                style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
