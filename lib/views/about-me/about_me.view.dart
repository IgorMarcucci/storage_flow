import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:storage_flow/app/theme/theme.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return LayoutBuilder(
      builder: (context, p1) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            // backgroundColor: Color.fromARGB(255, 218, 218, 218),
            surfaceTintColor: Colors.black12,
            centerTitle: true,
            title: const Text(
              'Sobre nós',
              selectionColor: Colors.black,
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.local_shipping,
                      size: p1.maxHeight > 600 ? 140 : 120,
                      color: const Color(0xFF075985)),
                  AutoSizeText(
                    'Estoque M&G',
                    style: tema.mainText,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: AutoSizeText(
                      'Somos um aplicativo de estoque intuitivo e eficiente, simplificando a gestão para negócios e uso pessoal. Nossa plataforma ajuda a controlar inventários, prevê reabastecimentos e independentemente do tamanho do estoque, estamos aqui para garantir sua organização e evitar perdas de vendas. Experimente hoje e mantenha seu estoque sempre em ordem...',
                      style: tema.rodapeTextBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
