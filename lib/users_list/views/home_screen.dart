// ignore_for_file: unnecessary_null_comparison, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mvvm/components/app_error.dart';
import 'package:mvvm/components/app_loading.dart';
import 'package:mvvm/components/user_list_row.dart';
import 'package:mvvm/users_list/models/users_list_model.dart';
import 'package:mvvm/users_list/view_models/users_view_model.dart';
import 'package:mvvm/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
              onPressed: () {
                openAddDetails(context);
              },
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          _ui(usersViewModel),
        ]),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading!) {
      return const AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(
        errorText: usersViewModel.userError.toString(),
      );
    }
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
        UserModel userModel = usersViewModel.userListModel![index];
        return UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            });
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: usersViewModel.userListModel!.length,
    ));
  }
}
