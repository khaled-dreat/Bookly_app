import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/category_books/category_books_cubit.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';

class CustomBtnDialog extends StatelessWidget {
  const CustomBtnDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Done'),
        onPressed: () {
          context
              .read<SrhBooksCubit>()
              .changeCategoryChoices(context.read<CategoryCubit>().state);
          context
              .read<SrhBooksCubit>()
              .changeSearchByChoices(context.read<SearchhByCubit>().state);
          Navigator.of(context).pop();
        });
  }
}
