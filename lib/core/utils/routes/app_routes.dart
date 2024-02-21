import 'package:clean_arch_bookly_app/features/auth/presentation/view/sign_in.dart';
import 'package:flutter/material.dart';
import '../../../features/category/presentation/book_categorie/view/book_categories_view.dart';
import '../../../features/category/presentation/categories/view/categories_view.dart';
import '../../../features/favorite/presentation/view/favorite_view.dart';
import '../../../features/home/presentation/view/book_details/book_details_view.dart';
import '../../../features/home/presentation/view/home/home_view.dart';
import '../../../features/profile/presentation/views/profile_view.dart';
import '../../../features/search/presentation/views/search/search_view.dart';
import '../../../features/splach/presentation/views/select_category/select_category_view.dart';
import '../../../features/splach/presentation/views/splach/splach_view.dart';

class AppRoutes {
  // * Pages  App
  static Map<String, WidgetBuilder> routes = {
    SplachView.nameRoute: (context) => const SplachView(),
    HomeView.nameRoute: (context) => const HomeView(),
    BookDetailsView.nameRoute: (context) => const BookDetailsView(),
    SearchView.nameRoute: (context) => const SearchView(),
    CategoriesView.nameRoute: (context) => const CategoriesView(),
    BookCategoriesView.nameRoute: (context) => const BookCategoriesView(),
    SelectCategoryView.nameRoute: (context) => const SelectCategoryView(),
    FavoriteView.nameRoute: (context) => const FavoriteView(),
    ProfileView.nameRoute: (context) => const ProfileView(),
    PageSignIn.nameRoute: (context) => const PageSignIn(),
  };

  // * inti Route
  static String? get initRoute => PageSignIn.nameRoute;

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
