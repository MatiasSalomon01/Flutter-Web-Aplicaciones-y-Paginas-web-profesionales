import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffedf1f2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const SideBar(),
              Expanded(
                child: Column(
                  children: [
                    const NavBar(),
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700) const SideBar(),
        ],
      ),
    );
  }
}
