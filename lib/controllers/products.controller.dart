import 'package:flutter/material.dart';
import 'package:storage_flow/models/product.model.dart';

class ProductsController extends ChangeNotifier {
  late TextEditingController barcodeController;
  late TextEditingController nameController;
  late TextEditingController qtdController;
  late TextEditingController priceController;
  late TextEditingController descController;
  List<ProductModel> productsList = [];

  ProductsController({
    required this.barcodeController,
    required this.nameController,
    required this.qtdController,
    required this.descController,
    required this.priceController,
  });

  void clearControllers() {
    barcodeController.clear();
    nameController.clear();
    qtdController.clear();
    priceController.clear();
    descController.clear();
    notifyListeners();
  }

  ProductModel setDataProduct() {
    return ProductModel(
      barcode: barcodeController.text,
      name: nameController.text,
      qtd: int.parse(qtdController.text),
      price: int.parse(priceController.text),
      desc: descController.text,
    );
  }

  void populateList(List<ProductModel> value){
    productsList = value;
    notifyListeners();
  }

// Função para transformar uma lista de QueryDocumentSnapshot<Object?> em uma lista de ProductModel
List<ProductModel> convertToProductList(List<QueryDocumentSnapshot<Object?>> snapshots) {
  return snapshots.map((snapshot) => ProductModel.fromSnapshot(snapshot)).toList();
}
}
