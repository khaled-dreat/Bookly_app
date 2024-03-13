import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/loading/app_loading.dart';
import '../../../../home/presentation/view/home/home_view.dart';
import '../../../../splach/presentation/maneg/select_category/select_category_cubit.dart';
import '../../../../splach/presentation/views/select_category/select_category_view.dart';
import '../sign_in.dart';

class WrapperStreamBuilder extends StatelessWidget {
  const WrapperStreamBuilder({
    super.key,
    required this.currentUsers,
  });
  final Stream<User?> currentUsers;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: currentUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading(loading: TypeLoading.page);
          }
          if (snapshot.hasData) {
            if (context.read<SelectCategoryCubit>().itemSelected.isNotEmpty) {
              return const HomeView();
            } else {
              return const SelectCategoryView();
            }
          } else {
            return const PageSignIn();
          }
        });
  }
}
