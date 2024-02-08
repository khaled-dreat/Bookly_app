import 'core/api/api_key.dart';
import 'core/utils/simple_bloc_observer/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app_start/clean_arch_bookly_app.dart';
import 'core/utils/setup_service_locator/setup_service_locator.dart';
import 'features/home/domain/entity/book_entity.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  //await Hive.openBox<BookEntity>(AppHiveKey.featFreeProgramBooks);
  await Hive.openBox<BookEntity>(ApiKey.freeNewsProgrammingBook);
  setupServiceLocatorHome();
  setupServiceLocatorSrh();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}
