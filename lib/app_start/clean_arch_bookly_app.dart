import 'package:clean_arch_bookly_app/features/home/data/repo/home_repo_empl.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_book_details_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_book_details_cubit/book_details_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/search/data/repo/srh_repo_emp.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repo/srh_repo.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/featured_srh_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/routes/app_routes.dart';
import '../core/utils/setup_service_locator/setup_service_locator.dart';
import '../core/utils/theme/app_theme_choose.dart';
import 'package:nested/nested.dart';

import '../features/home/presentation/manger/featured_new_books_cubit/new_books_cubit.dart';

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
          return BookDetailsCubit(FetchFeaturedBooksDeailsUseCase(
            homeRepo: getIt.get<HomeRepoEmpl>(),
          ));
        },
      )
    ];
  }
}
