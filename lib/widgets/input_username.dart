import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import '../app/validators/validate_username.dart';

class InputUsername extends StatelessWidget {
  const InputUsername({
    Key? key,
    required this.text,
    required this.typetxt,
    required this.icone,
  }) : super(key: key);

  final Icon icone;
  final String text;
  final TextInputType typetxt;

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: typetxt,
      decoration: InputDecoration(
        icon: icone,
        labelText: text,
      ),
      controller: userController.usernameController,
      validator: (value) => usernameValidate(value!),
    );
  }
}
