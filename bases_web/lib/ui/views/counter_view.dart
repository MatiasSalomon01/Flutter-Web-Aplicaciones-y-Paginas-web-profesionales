import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key, required this.base});

  final String base;

  @override
  State<CounterView> createState() => _CounterPageView();
}

class _CounterPageView extends State<CounterView> {
  int counter = 10;

  @override
  void initState() {
    super.initState();
    if (int.tryParse(widget.base) != null) counter = int.parse(widget.base);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Text(
          'Contador Stateful',
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Contador: $counter',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              text: 'Incrementar',
              onPressed: () => setState(() => counter++),
            ),
            CustomFlatButton(
              text: 'Decrementar',
              onPressed: () => setState(() => counter--),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
