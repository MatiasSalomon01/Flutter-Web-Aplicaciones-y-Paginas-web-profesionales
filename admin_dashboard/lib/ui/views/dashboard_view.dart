import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'DashboardView',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}