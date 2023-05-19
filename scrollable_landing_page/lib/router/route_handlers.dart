import 'package:fluro/fluro.dart';
import 'package:scrollable_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: (context, parameters) {
    final page = parameters['page']!.first;
    if (page != "/") {
      return const HomePage();
    }
  },
);
