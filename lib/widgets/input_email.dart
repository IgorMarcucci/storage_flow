import 'package:flutter/material.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/app/validators/validate_email.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({
    Key? key,
    required this.text,
    required this.typetxt,
    required this.icone,
    required this.inputMail,
  }) : super(key: key);

  final Icon icone;
  final String text;
  final TextInputType typetxt;
  final TextEditingController? inputMail;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      keyboardType: widget.typetxt,
      decoration: InputDecoration(
        icon: widget.icone,
        labelText: widget.text,
        // labelStyle: tema.styletextfield,
      ),
      style: tema.rodapeTextBlack,
      controller: widget.inputMail,
      validator: (value) => validateEmail(value!),
    );
  }
}
