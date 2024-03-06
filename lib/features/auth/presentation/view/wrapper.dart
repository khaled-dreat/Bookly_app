import 'dart:developer';

import 'package:clean_arch_bookly_app/features/favorite/presentation/manger/favorite_books/favorite_books_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading/app_loading.dart';
import '../../../home/presentation/view/home/home_view.dart';
import '../../../splach/presentation/maneg/select_category/select_category_cubit.dart';
import '../../../splach/presentation/views/select_category/select_category_view.dart';
import '../maneg/wrapper_cubit/wrapper_cubit.dart';
import 'sign_in.dart';

class WrapperView extends StatelessWidget {
  static const String nameRoute = 'Wrapper';
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WrapperViewBody(),
    );
  }
}

class WrapperViewBody extends StatefulWidget {
  const WrapperViewBody({
    super.key,
  });

  @override
  State<WrapperViewBody> createState() => _WrapperViewBodyState();
}

class _WrapperViewBodyState extends State<WrapperViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await context.read<WrapperCubit>().currentUserState();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrapperCubit, WrapperState>(
      builder: (context, state) {
        if (state is WrapperSuccess) {
          log("WrapperSuccess");

          return WrapperStreamBuilder(
            currentUsers: state.currentUsers,
          );
        } else if (state is WrapperFailure) {
          Text(state.errMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

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
