import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.hintText,
    required this.onQuerySubmited,
  });
  final String hintText;
  final ValueChanged<String> onQuerySubmited;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: TextField(
          style: GoogleFonts.ibmPlexSansArabic(),
          onChanged: onQuerySubmited,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: lightGreen5,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: lightGreen5),
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.ibmPlexSansArabic(),
            label: Text(
              'بحث',
              style: GoogleFonts.ibmPlexSansArabic(color: lightGreen5),
            ),
          ),
        ),
      ),
    );
  }
}
