import 'dart:developer';

import '../../../manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        style: TextStyle(color: Colors.black45, fontSize: 20.sp),
        controller: searchController,
        maxLines: 1,
        onSubmitted: (value) async {
          BlocProvider.of<SrhBooksCubit>(context).changeResult(value);
          BlocProvider.of<SrhBooksCubit>(context).booksList.clear();
          await BlocProvider.of<SrhBooksCubit>(context).fetchFeaturedSrhBooks();
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 17.sp),
          suffixIcon: IconButton(
            onPressed: () async {
              BlocProvider.of<SrhBooksCubit>(context)
                  .changeResult(searchController.text);
              BlocProvider.of<SrhBooksCubit>(context).booksList.clear();
              await BlocProvider.of<SrhBooksCubit>(context)
                  .fetchFeaturedSrhBooks();
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: Colors.black54,
            ),
          ),
          hintText: 'Search',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 8.r),
        ),
      ),
    );
  }
}
