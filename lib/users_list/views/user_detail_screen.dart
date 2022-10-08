// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, must_be_immutable
import 'package:flutter/material.dart';
import 'package:mvvm/components/app_title.dart';
import 'package:mvvm/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: usersViewModel.selectedUser!.name,
            ),
            Text(
              usersViewModel.selectedUser!.email,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
