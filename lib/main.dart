import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:clean_arch_bookly_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import 'app_start/clean_arch_bookly_app.dart';
import 'core/utils/language/app_lang.dart';
import 'core/utils/language/app_lang_config.dart';
import 'core/utils/local_data/app_local_data_key.dart';
import 'core/utils/restart/app_restart.dart';
import 'core/utils/setup_service_locator/setup_service_locator.dart';
import 'core/utils/simple_bloc_observer/simple_bloc_observer.dart';
import 'features/home/domain/entity/book_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();

  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(FavoriteBookEntityAdapter());

  // * FireBase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Open the Hive boxes
  await openHiveBoxes();

  setupServiceLocatorHome();
  setupServiceLocatorSrh();
  setupServiceLocatorFavorite();
  Bloc.observer = SimpleBlocObserver();

  runApp(EasyLocalization(
    supportedLocales: AppLangConfig.supportLocale,
    path: AppLangConfig.path,
    fallbackLocale: AppLangConfig.enLocale,
    child: const AppRestart(child: Bookly()),
  ));
}

Future<void> openHiveBoxes() async {
  await Hive.openBox<List<String>>(AppHiveKey.selectedCategory);
  await Hive.openBox<bool>(AppLang.keyShowLang);
  await Hive.openBox<FavoriteBookEntity>(AppHiveKey.favoriteBooks);
  await Hive.openBox<BookEntity>(AppHiveKey.selectedCategory1);
  await Hive.openBox<BookEntity>(AppHiveKey.selectedCategory2);
  await Hive.openBox<BookEntity>(AppHiveKey.selectedCategory3);
}
