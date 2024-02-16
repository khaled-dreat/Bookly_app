import 'package:clean_arch_bookly_app/core/utils/local_data/app_local_data_key.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/book_entity.dart';

import 'core/api/api_key.dart';
import 'core/utils/simple_bloc_observer/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app_start/clean_arch_bookly_app.dart';
import 'core/utils/setup_service_locator/setup_service_locator.dart';
import 'features/home/domain/entity/book_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(BookFavoriteEntityAdapter());
  await Hive.openBox<List<String>>(AppHiveKey.selectedCategory);
  await Hive.openBox<List<BookFavoriteEntity>>(AppHiveKey.favoriteBooks);
  await Hive.openBox<BookEntity>(AppHiveKey.selectedCategory1);
  await Hive.openBox<BookEntity>(AppHiveKey.selectedCategory2);
  await Hive.openBox<BookEntity>(AppHiveKey.selectedCategory3);
  setupServiceLocatorHome();
  setupServiceLocatorSrh();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}
