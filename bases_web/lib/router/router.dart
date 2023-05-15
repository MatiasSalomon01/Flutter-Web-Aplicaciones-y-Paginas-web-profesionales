import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define('/',
        handler: _counterHandler, transitionType: TransitionType.none);
    router.define('/stateful',
        handler: _counterHandler, transitionType: TransitionType.none);
    router.define('/provider',
        handler: _providerHandler, transitionType: TransitionType.none);
    router.define('/stateful/:base',
        handler: _counterHandler, transitionType: TransitionType.none);
    router.notFoundHandler = _pageNotFoundHandler;
  }

  //Handlers
  static final Handler _counterHandler = Handler(
    handlerFunc: (context, parameters) {
      return CounterView(
        base: parameters['base']?[0] ?? '5',
      );
    },
  );

  static final Handler _providerHandler = Handler(
    handlerFunc: (context, parameters) {
      return const CounterProviderView();
    },
  );

  static final Handler _pageNotFoundHandler = Handler(
    handlerFunc: (context, parameters) {
      return const View404();
    },
  );
}
