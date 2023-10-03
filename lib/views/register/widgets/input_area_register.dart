import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import 'package:storage_flow/widgets/input_email.dart';
import 'package:storage_flow/widgets/input_password.dart';
import 'package:storage_flow/widgets/input_username.dart';

class InputAreaRegister extends StatelessWidget {
  const InputAreaRegister({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const InputUsername(
            text: 'Insira o username',
            typetxt: TextInputType.name,
            icone: Icon(
              Icons.person,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputEmail(
            text: 'Insira o email',
            typetxt: TextInputType.emailAddress,
            icone: const Icon(Icons.mail),
            inputMail: userController.emailController,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputPassword(
            passwordController: userController.passwordController,
            text: 'Insira a senha',
            icone: const Icon(
              Icons.lock,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputPassword(
            passwordController: userController.confirmPasswordController,
            text: 'Confirme a senha',
            icone: const Icon(
              Icons.lock,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
