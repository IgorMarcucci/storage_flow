import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/controllers/products.controller.dart';
import 'package:storage_flow/views/products-list/widgets/button_list.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black12,
        centerTitle: true,
        title: Text(
          'Produtos',
          style: tema.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Consumer<ProductsController>(builder: (context, value, child) {
          return ListView.builder(
          itemCount: productsController.productsList.length,
          itemBuilder: (context, index) {
            return ListButton(
              value: productsController.productsList[index],
            );
          },
        );
        },)
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.push('/add-product');
      }, child: const Icon(Icons.add, color: Color(0xFF2564EB),),),
    );
  }
}
