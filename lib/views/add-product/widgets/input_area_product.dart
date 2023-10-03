import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/products.controller.dart';
import 'package:storage_flow/widgets/input_text.dart';

class InputAreaProduct extends StatelessWidget {
  const InputAreaProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputText(
            icone: const Icon(Icons.barcode_reader, color: Colors.black),
            controller: productsController.barcodeController,
            text: "Insira o código de barras",
            typetxt: TextInputType.number,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputText(
            icone: const Icon(Icons.edit, color: Colors.black),
            controller: productsController.nameController,
            text: "Insira o nome do produto",
            typetxt: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputText(
            icone: const Icon(Icons.numbers, color: Colors.black),
            controller: productsController.qtdController,
            text: "Insira a quantidade",
            typetxt: TextInputType.number,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputText(
            icone: const Icon(Icons.attach_money, color: Colors.black),
            controller: productsController.priceController,
            text: "Insira o preço do produto",
            typetxt: TextInputType.number,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputText(
            icone: const Icon(Icons.edit, color: Colors.black),
            controller: productsController.descController,
            text: "Insira a descrição do produto",
            typetxt: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
