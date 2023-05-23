import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

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
                    Expanded(child: widget.child),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, child) => Stack(
                children: [
                  Transform.translate(
                    offset: Offset(SideMenuProvider.movement.value, 0),
                    child: const SideBar(),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
