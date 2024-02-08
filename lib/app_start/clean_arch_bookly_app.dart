import '../features/home/data/repo/home_repo_empl.dart';
import '../features/home/domain/use_cases/fetch_also_like_book_use_case.dart';
import '../features/home/domain/use_cases/fetch_book_details_use_case.dart';
import '../features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import '../features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../features/home/presentation/manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../features/search/data/repo/srh_repo_emp.dart';
import '../features/search/domain/use_cases/featured_srh_books_use_case.dart';
import '../features/search/presentation/manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/routes/app_routes.dart';
import '../core/utils/setup_service_locator/setup_service_locator.dart';
import '../core/utils/theme/app_theme_choose.dart';
import 'package:nested/nested.dart';

import '../features/home/presentation/manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../features/home/presentation/manger/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import '../features/home/presentation/manger/fetch_new_books_cubit/fetch_new_books_cubit.dart';
import '../features/search/presentation/manger/category_books/category_books_cubit.dart';
import '../features/splach/presentation/maneg/select_category/select_category_cubit.dart';

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                // * Theme
                theme: AppThemeChoose.light(context),
                darkTheme: AppThemeChoose.dark(context),
                themeMode: ThemeMode.dark,
                // * Route
                routes: AppRoutes.routes,
                initialRoute: AppRoutes.initRoute,
              )),
    );
  }

  List<SingleChildWidget> get providers {
    return [
      BlocProvider(create: (context) {
        return SrhBooksCubit(
          FeaturedSrhBooksUseCase(
            srhBooksRepo: getIt.get<SrhRepoEmpl>(),
          ),
        )..fetchFeaturedSrhBooks();
      }),
      BlocProvider(
        create: (context) {
          return FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoEmpl>(),
            ),
          )..fetchFeaturedBooks();
        },
      ),
      BlocProvider(
        create: (context) {
          return NewestBooksCubit(
            FetchNewestdBooksUseCase(
              getIt.get<HomeRepoEmpl>(),
            ),
          )..fetchNewestBooks();
        },
      ),
      BlocProvider(
        create: (context) {
          return BookDetailsCubit(FetchBooksDeailsUseCase(
            homeRepo: getIt.get<HomeRepoEmpl>(),
          ));
        },
      ),
      BlocProvider(
        create: (context) {
          return AlsoLikeBooksCubit(FetchAlsoLikeBooksUseCase(
            homeRepo: getIt.get<HomeRepoEmpl>(),
          ));
        },
      ),
      BlocProvider(
        create: (context) {
          return SearchhByCubit();
        },
      ),
      BlocProvider(
        create: (context) {
          return CategoryCubit();
        },
      ),
      BlocProvider(
        create: (context) {
          return SelectCategoryCubit();
        },
      )
    ];
  }
}
