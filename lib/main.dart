import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:storage_flow/app/keys/keys.dart';
import 'package:storage_flow/app/providers/fields.provider.dart';
import 'package:storage_flow/app/providers/products.provider.dart';
import 'package:storage_flow/app/providers/user.provider.dart';
import 'package:storage_flow/app/routes/routes.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('userData');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [fieldsProvider, userProvider, productsProvider],
    child: const MainApp(),
  ));
}

Keys keys = Keys();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'storage_flow',
      theme: themeData(),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
