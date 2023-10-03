import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:storage_flow/app/theme/theme.dart';
import 'package:storage_flow/models/product.model.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    Key? key, required this.value,
  }) : super(key: key);

  final ProductModel value;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;

    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      height: 110,
      alignment: Alignment.centerLeft,
      decoration: tema.decorationListButton,
      child: SizedBox.expand(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 86,
                    child: Image.asset(
                      'assets/produto.png',
                      height: 46,
                      isAntiAlias: true,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      value.name!,
                      style: tema.rodapeTextBlack,
                      minFontSize: 8,
                    ),
                    AutoSizeText(
                      value.qtd.toString(),
                      textAlign: TextAlign.start,
                      style: tema.smallTextBlack,
                      minFontSize: 8,
                    ),
                    AutoSizeText(
                      value.price.toString(),
                      textAlign: TextAlign.start,
                      style: tema.smallTextBlack,
                      minFontSize: 8,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
