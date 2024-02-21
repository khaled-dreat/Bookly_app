import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading/app_loading.dart';
import '../../../home/presentation/view/home/home_view.dart';
import '../maneg/wrapper/wrapper_cubit.dart';
import 'sign_in.dart';

class Wrapper extends StatelessWidget {
  static const String nameRoute = 'Wrapper';
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WrapperCubit, WrapperState>(
        builder: (context, state) {
          if (state is WrapperSuccess) {
            return WrapperStreamBuilder(
              currentUsers: state.currentUsers,
            );
          } else if (state is WrapperFailure) {
            Text(state.errMessage);
          }
          return const CircularProgressIndicator();
        },
      ),
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
          return snapshot.hasData ? const HomeView() : const PageSignIn();
        });
  }
}
