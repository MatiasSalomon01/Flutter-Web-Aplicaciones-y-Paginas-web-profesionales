import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'services/services.dart';
import 'ui/ui.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => SideMenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserFormProvider(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: (context, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }
        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
