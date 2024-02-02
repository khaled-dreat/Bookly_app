import 'package:clean_arch_bookly_app/features/home/presentation/view/book_details/widgets/book_details_bloc_builder.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  static const String nameRoute = "BookDetailsView";
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetailsBlocBuilder()),
    );
  }
}
