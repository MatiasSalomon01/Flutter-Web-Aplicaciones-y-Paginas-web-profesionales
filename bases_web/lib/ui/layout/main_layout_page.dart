import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';

class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CustomAppMenu(),
            const Spacer(),
            Expanded(flex: 2, child: child),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
