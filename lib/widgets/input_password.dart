import 'package:flutter/material.dart';
import 'package:storage_flow/app/theme/theme.dart';
import '../app/validators/validate_password.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    Key? key,
    required this.text,
    required this.icone,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController? passwordController;
  final Icon icone;
  final String text;
  @override
  State<InputPassword> createState() => _InputPasswordState();
}

bool passenable = true;

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      obscureText: passenable,
      decoration: InputDecoration(
        icon: widget.icone,
        labelText: widget.text,
        suffix: IconButton(
          onPressed: () {
            setState(() {
              if (passenable) {
                passenable = false;
              } else {
                passenable = true;
              }
            });
          },
          icon:
              Icon(passenable == true ? Icons.remove_red_eye : Icons.password),
        ),
      ),
      style: tema.rodapeTextBlack,
      validator: (value) => passwordValidate(value!),
      controller: widget.passwordController,
    );
  }
}
