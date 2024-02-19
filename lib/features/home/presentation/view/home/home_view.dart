import 'package:clean_arch_bookly_app/features/home/presentation/view/home/widgets/coustom_appbar.dart';
import 'package:flutter/material.dart';
import 'widgets/home_view_body.dart';
import '../../../../drawer/presentation/view/drawer_body.dart';

class HomeView extends StatelessWidget {
  static const String nameRoute = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: DrawerBody(),
      appBar: CoustomAppBar(),
      body: HomeViewBody(),
    );
  }
}
