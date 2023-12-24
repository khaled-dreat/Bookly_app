import 'package:flutter/material.dart';

import '../../../features/home/presentation/view/book_details/book_details_view.dart';
import '../../../features/home/presentation/view/home/home_view.dart';
import '../../../features/search/presentation/views/search/search_view.dart';
import '../../../features/splach/presentation/views/splach/splach_view.dart';

class AppRoutes {
  // * Pages  App
  static Map<String, WidgetBuilder> routes = {
    SplachView.nameRoute: (context) => const SplachView(),
    HomeView.nameRoute: (context) => const HomeView(),
    BookDetailsView.nameRoute: (context) => const BookDetailsView(),
    SearchView.nameRoute: (context) => const SearchView(),
  };

  // * inti Route
  static String? get initRoute => SplachView.nameRoute;

  // * push Name
  static void go(BuildContext context, String nameRoute) =>
      Navigator.pushNamed(context, nameRoute);
  // * push Name Replace
  static void goReplace(BuildContext context, String nameRoute) =>
      Navigator.pushReplacementNamed(context, nameRoute);

  // * push Name
  static void goMaterial(BuildContext context, Widget page) {
    MaterialPageRoute<Widget> route =
        MaterialPageRoute(builder: (context) => page);
    Navigator.push(context, route);
  }
}

// * / -> index  -> home page
// * /setting
// * /about
