import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Contador Stateful',
            onPressed: () =>
                locator<NavigationService>().navigatorTo('stateful'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Contador Provider',
            onPressed: () =>
                locator<NavigationService>().navigatorTo('provider'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Otra Pagina',
            onPressed: () => locator<NavigationService>().navigatorTo('abc123'),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
