import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'BlankView',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        const WhiteCard(
          title: 'Blank View',
          child: Text('Blank View'),
        ),
      ],
    );
  }
}
