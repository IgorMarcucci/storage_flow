import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/controllers/fields.controller.dart';
import 'package:storage_flow/controllers/firebase.controller.dart';
import 'package:storage_flow/controllers/user.controller.dart';
import 'package:storage_flow/main.dart';
import 'package:storage_flow/views/login/widgets/input_area_login.dart';
import 'package:storage_flow/widgets/main_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    FieldsController fieldsController = context.read<FieldsController>();
    UserController userController = context.read<UserController>();
    FirebaseController firebaseController = FirebaseController();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return LayoutBuilder(
      builder: (context, p1) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Consumer<FieldsController>(
              builder: (context, value, child) {
                return IgnorePointer(
                  ignoring: fieldsController.loading,
                  child: Form(
                    key: keys.loginKey,
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          height: p1.maxHeight > 600
                              ? MediaQuery.of(context).size.height
                              : 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: p1.maxHeight > 600
                                    ? MediaQuery.of(context).size.height * 0.36
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
                                    Flexible(
                                      child: AutoSizeText(
                                        'Login',
                                        style: tema.mainText,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    const InputAreaLogin(),
                                    Flexible(
                                      child: SizedBox(
                                        height: 42,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: MainButton(
                                          text: 'Login',
                                          callback: () {
                                            if (keys.loginKey.currentState!
                                                .validate()) {
                                              firebaseController.loginAccount(
                                                context,
                                                userController.setDataToLogin(),
                                              );
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
