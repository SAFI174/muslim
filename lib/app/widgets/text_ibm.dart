import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextKufi extends StatelessWidget {
  final text;
  final double fontSize;
  const TextKufi({super.key, required this.text, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.notoKufiArabic(fontSize: fontSize),
      textAlign: TextAlign.center,
    );
  }
}
