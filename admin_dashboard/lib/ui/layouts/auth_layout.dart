import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //Desktop
          _DesktopBody()
          //Mobile

          //Links
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
