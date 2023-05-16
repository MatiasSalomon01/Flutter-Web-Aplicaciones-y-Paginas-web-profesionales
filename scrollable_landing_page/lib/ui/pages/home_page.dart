import 'package:flutter/material.dart';
import 'package:scrollable_landing_page/ui/views/about_view.dart';
import 'package:scrollable_landing_page/ui/views/contact_view.dart';
import 'package:scrollable_landing_page/ui/views/home_view.dart';
import 'package:scrollable_landing_page/ui/views/location_view.dart';
import 'package:scrollable_landing_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          const _HomeBody(),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 150,
              height: 50,
              color: Colors.black,
            ),
          )
        ],
      ),
    ));
  }
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