import 'package:flutter/material.dart';
import 'package:mvvm/users_list/views/user_detail_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => UserDetailScreeen()));
}
