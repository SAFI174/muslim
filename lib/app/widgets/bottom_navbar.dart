import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:muslim/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  final ValueChanged<int> onTap;
  const BottomNavBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(0),
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: GNav(
          backgroundColor: Colors.grey.shade300,
          color: Colors.black,
          activeColor: lightGreen7,
          tabBackgroundColor: lightGreen2,
          textStyle: GoogleFonts.notoKufiArabic(fontSize: 14),
          iconSize: 20,
          haptic: false,
          onTabChange: onTap,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          gap: 8,
          tabs: const [
            GButton(
              icon: FeatherIcons.home,
              text: 'الرئيسية',
            ),
            GButton(
              icon: FeatherIcons.bell,
              text: 'الصلاوات',
            ),
            GButton(
              icon: FeatherIcons.bookOpen,
              text: 'القران',
            ),
            GButton(
              icon: FeatherIcons.slack,
              text: 'أذكار',
            ),
            GButton(
              icon: FeatherIcons.compass,
              text: 'القبلة',
            ),
          ],
        ),
      ),
    );
  }
}
