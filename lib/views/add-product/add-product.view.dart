import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/controllers/fields.controller.dart';
import 'package:storage_flow/main.dart';
import 'package:storage_flow/views/add-product/widgets/input_area_product.dart';
import 'package:storage_flow/widgets/main_button.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    FieldsController fieldsController = context.read<FieldsController>();
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
                'Adicionar produto',
                selectionColor: Colors.black,
              ),
            ),
            body: Consumer<FieldsController>(
              builder: (context, value, child) {
                return IgnorePointer(
                  ignoring: fieldsController.loading,
                  child: Form(
                    key: keys.newProductKey,
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
                                    Flexible(
                                      child: AutoSizeText(
                                        'Informações do produto',
                                        style: tema.mainText,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    const InputAreaProduct(),
                                    Flexible(
                                      child: SizedBox(
                                        height: 42,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: MainButton(
                                          text: 'Adicionar produto',
                                          callback: () {
                                            if (keys.newProductKey.currentState!
                                                .validate()) {}
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
