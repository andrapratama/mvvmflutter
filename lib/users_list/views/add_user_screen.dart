// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mvvm/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
            onPressed: () async {
              bool userAdded = await usersViewModel.addUser();
              if (!userAdded) {
                return;
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (val) async {
                  usersViewModel.addingUser.name = val;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: (val) async {
                  usersViewModel.addingUser.email = val;
                },
              )
            ],
          )),
    );
  }
}
