import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "wrapper_stream_builder.dart";
import '../../maneg/wrapper_cubit/wrapper_cubit.dart';

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
