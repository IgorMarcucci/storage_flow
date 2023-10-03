import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/products.controller.dart';

ChangeNotifierProvider productsProvider =
    ChangeNotifierProvider<ProductsController>(
  create: (context) => ProductsController(
      barcodeController: TextEditingController(),
      nameController: TextEditingController(),
      qtdController: TextEditingController(),
      descController: TextEditingController(),
      priceController: TextEditingController()),
);
