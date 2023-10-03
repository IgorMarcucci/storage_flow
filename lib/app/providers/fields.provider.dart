import 'package:provider/provider.dart';
import 'package:storage_flow/controllers/fields.controller.dart';

ChangeNotifierProvider fieldsProvider =
    ChangeNotifierProvider<FieldsController>(
  create: (context) => FieldsController(),
);
