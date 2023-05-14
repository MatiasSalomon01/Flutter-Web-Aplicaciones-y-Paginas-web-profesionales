import 'package:flutter/material.dart';

class _NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigatorTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(String routeName) {
    return navigatorKey.currentState!.pop();
  }
}

final navigationService = _NavigationService();
