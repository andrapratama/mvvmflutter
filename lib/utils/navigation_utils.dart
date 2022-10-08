import 'package:flutter/material.dart';
import 'package:mvvm/users_list/views/add_user_screen.dart';
import 'package:mvvm/users_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailsScreeen(),
    ),
  );
}

void openAddDetails(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserScreen(),
      ));
}
