// import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  int getPageIndex(String routeName) {
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
  }

  goTo(int index) {
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
