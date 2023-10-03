import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:storage_flow/app/theme/theme.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.text,
      required this.callback,
      required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      decoration: tema.decorationMainButton,
      child: SizedBox.expand(
        child: TextButton(
          style: tema.styleButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: const Color.fromARGB(221, 255, 255, 255),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.005,
              ),
              Flexible(
                child: AutoSizeText(
                  text,
                  style: tema.textMedium,
                  minFontSize: 6,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                ),
              ),
            ],
          ),
          onPressed: () {
            callback();
          },
        ),
      ),
    );
  }
}
