import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/user.controller.dart';

ChangeNotifierProvider userProvider = ChangeNotifierProvider<UserController>(
  create: (context) => UserController(
      usernameController: TextEditingController(),
      passwordController: TextEditingController(),
      emailController: TextEditingController(),
      confirmPasswordController: TextEditingController()),
);
