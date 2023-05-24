import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = "/";

  // Auth Router
  static String loginRoute = "/auth/login";
  static String registerRoute = "/auth/register";

  //Dashboard
  static String dashboardRoute = "/dashboard";
  static String iconsRoute = "/dashboard/icons";

  // Auth Routes
  static void configureRoutes() {
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.none,
    );
    router.define(
      iconsRoute,
      handler: DashboardHandlers.icons,
      transitionType: TransitionType.none,
    );

    router.notFoundHandler = NotPageFoundHandlers.noPageFound;
  }
}
