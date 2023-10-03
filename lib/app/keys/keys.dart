import 'package:flutter/material.dart';

class Keys {
  final loginKey = GlobalKey<FormState>(debugLabel: 'loginKey');
  final registerKey = GlobalKey<FormState>(debugLabel: 'registerKey');
  final newProductKey = GlobalKey<FormState>(debugLabel: 'newProductKey');
  final editProductKey = GlobalKey<FormState>(debugLabel: 'editProductKey');
  final sendEmailKey = GlobalKey<FormState>(debugLabel: 'sendEmailKey');
  final productKey = GlobalKey<FormState>(debugLabel: 'productKey');
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKey');
}
