import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String uid;
  const UserView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'UserView',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        WhiteCard(
          title: 'User View',
          child: Text('UID: $uid'),
        ),
      ],
    );
  }
}
