import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nested/nested.dart';
import '../core/utils/routes/app_routes.dart';
import '../core/utils/setup_service_locator/setup_service_locator.dart';
import '../core/utils/theme/app_theme_choose.dart';
import '../features/auth/presentation/maneg/auth_cubit/auth_cubit.dart';
import '../features/auth/presentation/maneg/wrapper_cubit/wrapper_cubit.dart';
import '../features/category/presentation/categories/manger/fetch_category_books/fetch_category_books_cubit.dart';
import '../features/drawer/presentation/manger/lang/lang_cubit.dart';
import '../features/favorite/data/repo/favorite_repo_empl.dart';
import '../features/favorite/domain/use_cases/add_favorite_book_use_case.dart';
import '../features/favorite/domain/use_cases/fetch_favorite_book_use_case.dart';
import '../features/favorite/domain/use_cases/remove_favorite_book_use_case.dart';
import '../features/favorite/presentation/manger/favorite_books/favorite_books_cubit.dart';
import '../features/home/data/repo/home_repo_empl.dart';
import '../features/home/domain/use_cases/fetch_also_like_book_use_case.dart';
import '../features/home/domain/use_cases/fetch_book_details_use_case.dart';
import '../features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import '../features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../features/home/presentation/manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../features/home/presentation/manger/fetch_category_home_books_cubit/index_1/fetch_category_books_index1_cubit.dart';
import '../features/home/presentation/manger/fetch_category_home_books_cubit/index_2/fetch_category_books_index2_cubit.dart';
import '../features/home/presentation/manger/fetch_category_home_books_cubit/index_3/fetch_category_books_index3_cubit.dart';
import '../features/home/presentation/manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../features/home/presentation/manger/fetch_new_books_cubit/fetch_new_books_cubit.dart';
import '../features/search/data/repo/srh_repo_emp.dart';
import '../features/search/domain/use_cases/featured_srh_books_use_case.dart';
import '../features/search/presentation/manger/category_books/category_books_cubit.dart';
import '../features/search/presentation/manger/srh_books/srh_books_cubit.dart';
import '../features/splach/presentation/maneg/select_category/select_category_cubit.dart';

class Bookly extends StatefulWidget {
  const Bookly({super.key});

  @override
  State<Bookly> createState() => _BooklyState();
}

class _BooklyState extends State<Bookly> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                // * Language
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
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
      BlocProvider(
        create: (context) {
          return LangCubit();
        },
      ),
      BlocProvider(create: (context) {
        return SrhBooksCubit(
          FeaturedSrhBooksUseCase(
            srhBooksRepo: getIt.get<SrhRepoEmpl>(),
          ),
        )..fetchFeaturedSrhBooks();
      }),
      BlocProvider(
        create: (context) {
          return FetchCategoryBooksIndex1Cubit(
            FetchCategoryHomeBooksUseCase(
              homeRepo: getIt.get<HomeRepoEmpl>(),
            ),
          );
        },
      ),
      BlocProvider(
        create: (context) {
          return FetchCategoryBooksCubit(
            FetchCategoryHomeBooksUseCase(
              homeRepo: getIt.get<HomeRepoEmpl>(),
            ),
          );
        },
      ),
      BlocProvider(
        create: (context) {
          return FetchCategoryBooksIndex2Cubit(
            FetchCategoryHomeBooksUseCase(
              homeRepo: getIt.get<HomeRepoEmpl>(),
            ),
          );
        },
      ),
      BlocProvider(
        create: (context) {
          return FetchCategoryBooksIndex3Cubit(
            FetchCategoryHomeBooksUseCase(
              homeRepo: getIt.get<HomeRepoEmpl>(),
            ),
          );
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
          return AuthCubit();
        },
      ),
      BlocProvider(
        create: (context) {
          return FavoriteBooksCubit(
            AddFavoriteBooksUseCase(
              favoriteRepo: getIt.get<FavoriteRepoEmpl>(),
            ),
            FetchFavoriteBooksUseCase(
              favoriteRepo: getIt.get<FavoriteRepoEmpl>(),
            ),
            RemoveFavoriteBooksUseCase(
              favoriteRepo: getIt.get<FavoriteRepoEmpl>(),
            ),
          );
        },
      ),
      BlocProvider(
        create: (context) {
          return WrapperCubit();
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
      ),
      //  BlocProvider(
      //    create: (context) {
      //      return LangCubit();
      //    },
      //  )
    ];
  }
}
