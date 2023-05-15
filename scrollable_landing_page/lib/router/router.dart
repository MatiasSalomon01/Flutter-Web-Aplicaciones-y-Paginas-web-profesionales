import 'package:fluro/fluro.dart';

import 'route_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(':/page', handler: homeHandler);

    //Page Not Found - Status 404
    router.notFoundHandler = homeHandler;
  }
}
