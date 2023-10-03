import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final BoxDecoration? cardTheme;
  final BoxDecoration? paletteDecoration;
  final BoxDecoration? paletteDecorationInverted;
  final BoxDecoration? decorationMainButton;
  final BoxDecoration? decorationListButton;
  final ButtonStyle? styleButton;
  final TextStyle? rodapeTextBlack;
  final TextStyle? mainText;
  final TextStyle? mainTextWhite;
  final TextStyle? textMedium;
  final TextStyle? smallTextBlack;
  

  CustomTheme({
    this.paletteDecoration,
    this.paletteDecorationInverted,
    this.cardTheme,
    this.decorationMainButton,
    this.decorationListButton,
    this.styleButton,
    this.rodapeTextBlack,
    this.mainText,
    this.mainTextWhite,
    this.textMedium,
    this.smallTextBlack,
  });

  @override
  CustomTheme copyWith({
    BoxDecoration? paletteDecoration,
    BoxDecoration? paletteDecorationInverted,
    BoxDecoration? cardTheme,
    BoxDecoration? decorationMainButtton,
    BoxDecoration? decorationListButton,
    ButtonStyle? styleButton,
    TextStyle? rodapeTextBlack,
    TextStyle? mainText,
    TextStyle? mainTextWhite,
    TextStyle? textMedium,
    TextStyle? smallTextBlack,
  }) {
    return CustomTheme(
      paletteDecoration: paletteDecoration ?? this.paletteDecoration,
      paletteDecorationInverted:
          paletteDecorationInverted ?? this.paletteDecorationInverted,
      cardTheme: cardTheme ?? this.cardTheme,
      decorationMainButton: decorationMainButton ?? decorationMainButton,
      decorationListButton: decorationListButton ?? decorationListButton,
      styleButton: styleButton ?? this.styleButton,
      rodapeTextBlack: rodapeTextBlack ?? this.rodapeTextBlack,
      mainText: mainText ?? this.mainText,
      mainTextWhite: mainTextWhite ?? this.mainTextWhite,
      textMedium: textMedium ?? this.textMedium,
      smallTextBlack: smallTextBlack ?? this.smallTextBlack,
    );
  }

  @override
  CustomTheme lerp(ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme(
      paletteDecoration:
          BoxDecoration.lerp(paletteDecoration, other.paletteDecoration, t),
      paletteDecorationInverted: BoxDecoration.lerp(
          paletteDecorationInverted, other.paletteDecorationInverted, t),
      cardTheme: BoxDecoration.lerp(cardTheme, other.cardTheme, t),
      decorationMainButton: BoxDecoration.lerp(
          decorationMainButton, other.decorationMainButton, t),
      decorationListButton: BoxDecoration.lerp(decorationListButton, other.decorationListButton, t),
      styleButton: ButtonStyle.lerp(styleButton, other.styleButton, t),
      rodapeTextBlack:
          TextStyle.lerp(rodapeTextBlack, other.rodapeTextBlack, t),
      mainText: TextStyle.lerp(mainText, other.mainText, t),
      mainTextWhite: TextStyle.lerp(mainTextWhite, other.mainTextWhite, t),
      textMedium: TextStyle.lerp(textMedium, other.textMedium, t),
      smallTextBlack: TextStyle.lerp(smallTextBlack, other.smallTextBlack, t),
    );
  }
}

ThemeData themeData() => ThemeData.light().copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          error: const Color.fromARGB(255, 255, 120, 120)),
      extensions: <ThemeExtension<dynamic>>[
        CustomTheme(
          styleButton: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
          ),
          decorationListButton: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(100, 40, 40, 40),
                offset: Offset(0, 2),
                blurRadius: 7.0,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          decorationMainButton: const BoxDecoration(
            color: Color(0xFF2564EB),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x63282828),
                offset: Offset(2, 4),
                blurRadius: 5.0,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          cardTheme: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(100, 40, 40, 40),
                offset: Offset(2, 4),
                blurRadius: 7.0,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          paletteDecoration: const BoxDecoration(
            color: Color(0xFF2564EB),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF2B2B2B),
                offset: Offset(0, 4),
                blurRadius: 7,
                blurStyle: BlurStyle.normal,
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          paletteDecorationInverted: const BoxDecoration(
            color: Color(0xFF2564EB),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF2B2B2B),
                offset: Offset(0, -4),
                blurRadius: 7,
                blurStyle: BlurStyle.normal,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          rodapeTextBlack: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
          ),
          mainText: GoogleFonts.poppins(
            fontSize: 26,
            color: Colors.black,
          ),
          mainTextWhite: GoogleFonts.poppins(
            fontSize: 26,
            color: Colors.white,
          ),
          textMedium: GoogleFonts.poppins(
            fontSize: 18,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          smallTextBlack: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
