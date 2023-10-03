import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/validators/validate_text.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import '../app/validators/validate_username.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.controller,
    required this.text,
    required this.typetxt,
    required this.icone,
  }) : super(key: key);

  final TextEditingController controller;
  final Icon icone;
  final String text;
  final TextInputType typetxt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: typetxt,
      decoration: InputDecoration(
        icon: icone,
        labelText: text,
      ),
      controller: controller,
      validator: (value) => textValidate(value!),
    );
  }
}
