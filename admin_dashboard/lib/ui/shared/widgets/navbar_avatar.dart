import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: const Image(
          image: NetworkImage(
            'https://lh3.google.com/u/0/ogw/AOLn63FaS5AGx-OyPmg9S3jxS-nhcV-aDmx6RJ9w9rmJ=s32-c-mo',
          ),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
