import 'package:bases_web/router/route_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define('/',
        handler: counterHandler, transitionType: TransitionType.none);

    router.define('/stateful',
        handler: counterHandler, transitionType: TransitionType.none);

    router.define('/provider',
        handler: providerHandler, transitionType: TransitionType.none);

    router.define('/stateful/:base',
        handler: counterHandler, transitionType: TransitionType.none);

    router.define('/dashboard/user/:name/:id',
        handler: multipleQueryHandler, transitionType: TransitionType.none);

    router.notFoundHandler = pageNotFoundHandler;
  }
}
