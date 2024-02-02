import 'package:clean_arch_bookly_app/features/search/presentation/manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chips_choice/chips_choice.dart';

import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../manger/category_books/category_books_cubit.dart';

class CustomSearchTextField extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 0.9);
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
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => showCustomDialog(context),
          icon: Icon(Icons.filter_alt, size: 20.r),
        )
      ],
      title: SizedBox(
        height: 35,
        child: TextField(
          style: TextStyle(color: Colors.black45, fontSize: 20.sp),
          controller: searchController,
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp),
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
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.r, horizontal: 8.r),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  List<String> choices = [
    "Mystery and Thrillers",
    "Biography and Memoirs",
    "Self Development",
    "Romance",
    "Fantasy",
    "History",
    "Philosophy",
    "Religion and Spirituality",
    "Art and Design",
    "Business and Finance",
    "Health and Wellness",
    "Science and Technology",
    "Politics and Government",
    "Sports and Recreation",
    "Children's Books",
  ];
  List<String> choicesSearchBy = [
    "Title",
    "Auther",
    "In Publisher",
    "SBN Number",
    "ICCN Number",
    "OCLC Number",
  ];

  showDialog(
    context: context,
    //  barrierDismissible: false,
    builder: (BuildContext context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 250.w,
        height: 360.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Custom search",
                style: AppTheme.h6(context),
              ),
              const Divider(height: 15, thickness: 3),
              SizedBox(
                height: 270.h, // تعيين ارتفاع ثابت هنا
                child: ListView(
                  // Replace SingleChildScrollView with ListView
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Text(
                        "Search By",
                        style: AppTheme.s1(context),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 45.0),
                      child: Divider(
                        indent: 40,
                      ),
                    ),
                    BlocBuilder<SearchhByCubit, String>(
                      builder: (context, state) {
                        return ChipsChoice<String>.single(
                          value: state,
                          wrapped: true,
                          onChanged: (val) {
                            context
                                .read<SearchhByCubit>()
                                .updateSelectedSearchByChoices(val);
                          },
                          choiceItems: C2Choice.listFrom<String, String>(
                            source: choicesSearchBy,
                            value: (i, v) => v,
                            label: (i, v) => v,
                          ),
                        );
                      },
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.only(left: 90.r),
                      title: const Text("Category"),
                      children: [
                        BlocBuilder<CategoryCubit, List<String>>(
                          builder: (context, state) {
                            return ChipsChoice<String>.multiple(
                              value: state,
                              wrapped: true,
                              onChanged: (val) {
                                context
                                    .read<CategoryCubit>()
                                    .updateSelectedCategoryChoices(val);
                              },
                              choiceItems: C2Choice.listFrom<String, String>(
                                source: choices,
                                value: (i, v) => v,
                                label: (i, v) => v,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  child: const Text('Done'),
                  onPressed: () {
                    context.read<SrhBooksCubit>().changeCategoryChoices(
                        context.read<CategoryCubit>().state);
                    context.read<SrhBooksCubit>().changeSearchByChoices(
                        context.read<SearchhByCubit>().state);
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    ),
  );
}
