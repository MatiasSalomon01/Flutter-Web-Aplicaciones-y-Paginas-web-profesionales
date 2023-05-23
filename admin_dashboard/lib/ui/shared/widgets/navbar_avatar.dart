import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: const Image(
          image: NetworkImage(
            'https://img.freepik.com/vector-premium/vector-diseno-icono-avatar-persona-uso-multiple-ilustracion-vectorial_625349-284.jpg?w=400',
          ),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
