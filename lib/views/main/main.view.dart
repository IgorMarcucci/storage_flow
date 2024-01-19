import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/services/storage.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/controllers/firebase.controller.dart';
import 'package:storage_flow/controllers/products.controller.dart';
import 'package:storage_flow/main.dart';
import 'package:storage_flow/models/product.model.dart';
import 'package:storage_flow/models/user.model.dart';
import 'package:storage_flow/widgets/loading_indicator.dart';
import 'package:storage_flow/widgets/main_button.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  UserModel user = UserModel();

  @override
  void initState() {
    StorageData storageData = StorageData();
    Map<String, dynamic> map =
        Map<String, dynamic>.from(storageData.readData('userData'));
    print(map);
    user = UserModel.fromJson(map);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductModel model = ProductModel();
    ProductsController productsController = context.read<ProductsController>();
    FirebaseController firebaseController = FirebaseController();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return FutureBuilder(
      future: firebaseController.getData(user, 'products'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: const Center(
              child: Text('Erro de conexão'),
            ),
          );
        }
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            productsController.populateList();
          });

          return LayoutBuilder(
            builder: (context, p1) {
              return Scaffold(
                backgroundColor: Colors.white,
                key: keys.scaffoldKey,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  // backgroundColor: Color.fromARGB(255, 218, 218, 218),
                  surfaceTintColor: Colors.black12,
                  centerTitle: true,
                  title: const Text(
                    'Menu',
                    selectionColor: Colors.black,
                  ),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 220,
                            child: UserAccountsDrawerHeader(
                              decoration: const BoxDecoration(
                                color: Color(0xFF2564EB),
                              ),
                              accountEmail: FittedBox(
                                child: Text(
                                  user.email.toString(),
                                  style: tema.textMedium,
                                ),
                              ),
                              accountName: FittedBox(
                                child: Text(
                                  user.username.toString(),
                                  style: tema.textMedium,
                                ),
                              ),
                              currentAccountPicture: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 80,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: SizedBox(
                                  height: 42,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(
                                      'Sair',
                                      style: tema.rodapeTextBlack,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  firebaseController.logout();
                                  context.go('/');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                drawerEnableOpenDragGesture: false,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: p1.maxHeight > 600
                          ? MediaQuery.of(context).size.height - 60
                          : 600,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Consumer<ProductsController>(
                                builder: (context, value, child) {
                                  return SizedBox(
                                    height: p1.maxHeight > 600
                                        ? MediaQuery.of(context).size.height *
                                            0.36
                                        : 216,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Dashboard',
                                            style: tema.mainText,
                                          ),
                                        ),
                                        Container(
                                          decoration: tema.decorationMainButton,
                                          height: 130,
                                          margin: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      'Meus produtos',
                                                      style: tema.mainTextWhite,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          'Total:',
                                                          style:
                                                              tema.textMedium,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          productsController
                                                              .productsList
                                                              .length
                                                              .toString(),
                                                          style: GoogleFonts.poppins(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                              fontSize: 36,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: p1.maxHeight > 600
                                  ? MediaQuery.of(context).size.height * 0.64 -
                                      60
                                  : 384,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 42,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: MainButton(
                                        text: "Produtos",
                                        callback: () {
                                          context.push('/add-product');
                                        },
                                        icon: Icons.inventory),
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
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
