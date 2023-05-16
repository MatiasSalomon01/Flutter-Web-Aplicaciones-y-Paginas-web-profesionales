import 'package:flutter/material.dart';
import 'package:scrollable_landing_page/ui/views/about_view.dart';
import 'package:scrollable_landing_page/ui/views/contact_view.dart';
import 'package:scrollable_landing_page/ui/views/home_view.dart';
import 'package:scrollable_landing_page/ui/views/location_view.dart';
import 'package:scrollable_landing_page/ui/views/pricing_view.dart';

import '../shared/custom_app_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: _buildBoxDecoration(),
      child: Stack(
        children: const [
          _HomeBody(),
          Positioned(top: 20, right: 20, child: CustomAppMenu())
        ],
      ),
    ));
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink, Colors.deepPurpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}
