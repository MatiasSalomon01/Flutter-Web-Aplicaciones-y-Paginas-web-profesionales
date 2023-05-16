import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isOpen ? 50 : 0,
              ),
              Text(
                'Menu',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
              ),
              const Spacer(),
              // AnimatedIcon(icon: AnimatedIcons.close_menu, progress: , color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
