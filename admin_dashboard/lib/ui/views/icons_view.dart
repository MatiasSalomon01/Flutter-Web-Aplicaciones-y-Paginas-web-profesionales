import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Icons',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        // const WhiteCard(
        //   title: 'Sales Statistics',
        //   child: Text('Hola Mundo'),
        // ),

        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: const [
            WhiteCard(
              width: 170,
              title: 'ac_unit_outlined',
              child: Center(
                child: Icon(Icons.ac_unit_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'aspect_ratio',
              child: Center(
                child: Icon(Icons.aspect_ratio),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'g_mobiledata_outlined',
              child: Center(
                child: Icon(Icons.g_mobiledata_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'gamepad',
              child: Center(
                child: Icon(Icons.gamepad),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'handyman_sharp',
              child: Center(
                child: Icon(Icons.handyman_sharp),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'access_alarm_outlined',
              child: Center(
                child: Icon(Icons.access_alarm_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'ac_unit_outlined',
              child: Center(
                child: Icon(Icons.ac_unit_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'aspect_ratio',
              child: Center(
                child: Icon(Icons.aspect_ratio),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'g_mobiledata_outlined',
              child: Center(
                child: Icon(Icons.g_mobiledata_outlined),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'gamepad',
              child: Center(
                child: Icon(Icons.gamepad),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'handyman_sharp',
              child: Center(
                child: Icon(Icons.handyman_sharp),
              ),
            ),
            WhiteCard(
              width: 170,
              title: 'access_alarm_outlined',
              child: Center(
                child: Icon(Icons.access_alarm_outlined),
              ),
            ),
          ],
        )
      ],
    );
  }
}
