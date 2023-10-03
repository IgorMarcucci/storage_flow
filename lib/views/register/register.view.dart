import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/controllers/fields.controller.dart';
import 'package:storage_flow/controllers/firebase.controller.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import 'package:storage_flow/main.dart';
import 'package:storage_flow/views/register/widgets/input_area_register.dart';
import 'package:storage_flow/widgets/main_button.dart';
import 'package:storage_flow/widgets/message.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FieldsController fieldsController = context.read<FieldsController>();
    FirebaseController firebaseController = FirebaseController();
    UserController userController = context.read<UserController>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
                // userController.clearControllers();
              },
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.black12,
            title: Text(
              'Cadastro',
              style: tema.mainText,
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: Consumer<FieldsController>(
            builder: (context, value, child) {
              return IgnorePointer(
                ignoring: fieldsController.loading,
                child: Form(
                  key: keys.registerKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          child: Center(
                            child: Icon(Icons.local_shipping,
                                size: MediaQuery.of(context).size.height > 600
                                    ? 140
                                    : 120,
                                color: const Color(0xFF075985)),
                          ),
                        ),
                        const Center(
                          child: InputAreaRegister(),
                        ),
                        SizedBox(
                          height: 42,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Center(
                            child: MainButton(
                              text: 'Cadastrar',
                              icon: Icons.check,
                              callback: () {
                                if (keys.registerKey.currentState!.validate()) {
                                  if (userController
                                          .confirmPasswordController.text ==
                                      userController.passwordController.text) {
                                    firebaseController.createAccount(context,
                                        userController.setDataToRegister());
                                    userController.clearControllers();
                                  } else {
                                    message(
                                        context, "As senhas devem ser iguais.");
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
