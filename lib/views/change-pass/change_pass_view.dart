import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/controllers/fields.controller.dart';
import 'package:storage_flow/controllers/firebase.controller.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import 'package:storage_flow/main.dart';
import 'package:storage_flow/widgets/input_email.dart';
import 'package:storage_flow/widgets/main_button.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseController firebaseController = FirebaseController();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    FieldsController fieldsController = context.read<FieldsController>();
    UserController userController = context.read<UserController>();
    return LayoutBuilder(
      builder: (context, p1) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              // backgroundColor: Color.fromARGB(255, 218, 218, 218),
              surfaceTintColor: Colors.black12,
              centerTitle: true,
              title: const Text(
                'Alterar senha',
                selectionColor: Colors.black,
              ),
            ),
            body: Consumer<FieldsController>(
              builder: (context, value, child) {
                return IgnorePointer(
                  ignoring: fieldsController.loading,
                  child: Form(
                    key: keys.sendEmailKey,
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          height: p1.maxHeight > 600
                              ? MediaQuery.of(context).size.height - 56
                              : 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: p1.maxHeight > 600
                                    ? MediaQuery.of(context).size.height *
                                            0.36 -
                                        56
                                    : 216,
                                child: Center(
                                  child: Icon(Icons.local_shipping,
                                      size: p1.maxHeight > 600 ? 140 : 120,
                                      color: const Color(0xFF075985)),
                                ),
                              ),
                              SizedBox(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                height: p1.maxHeight > 600
                                    ? MediaQuery.of(context).size.height * 0.64
                                    : 384,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 0, 30, 0),
                                      child: AutoSizeText(
                                        'Insira seu endereço de email cadastrado no aplicativo, iremos enviar um email de alteração de senha!',
                                        style: tema.mainText,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: InputEmail(
                                        text: 'Insira o email',
                                        typetxt: TextInputType.emailAddress,
                                        icone: const Icon(Icons.mail),
                                        inputMail:
                                            userController.emailController,
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 42,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: MainButton(
                                          text: 'Alterar senha',
                                          callback: () {
                                            if (keys.sendEmailKey.currentState!
                                                .validate()) {
                                              firebaseController.forgetPass(
                                                  context,
                                                  userController
                                                      .setDataToChangePass());
                                              userController.clearControllers();
                                            }
                                          },
                                          icon: Icons.login,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
