import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import 'package:storage_flow/widgets/input_email.dart';
import 'package:storage_flow/widgets/input_password.dart';

class InputAreaLogin extends StatelessWidget {
  const InputAreaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputEmail(
            text: 'Insira o email',
            typetxt: TextInputType.emailAddress,
            icone: const Icon(Icons.mail),
            inputMail: userController.emailController,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputPassword(
            text: 'Insira a senha',
            passwordController: userController.passwordController,
            icone: const Icon(
              Icons.lock,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Container(
            height: 40,
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.white,
              ),
              onPressed: () {
                context.push('/change-pass');
              },
              child: const AutoSizeText(
                "Recuperar senha",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black54, fontSize: 14),
                minFontSize: 10,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: SizedBox(
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.white,
              ),
              onPressed: () {
                context.push('/register');
              },
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text: 'Não tem uma conta?',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    TextSpan(
                      text: ' Cadastre-se...',
                      style: TextStyle(color: Color(0xFF2564EB), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
