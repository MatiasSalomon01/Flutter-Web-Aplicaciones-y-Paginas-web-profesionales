import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.indigo,
        width: 30,
        height: 30,
        child: Center(
          child: Text(
            'M',
            style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
