import '../../../../core/utils/local_data/app_local_data_key.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/book_entity.dart';

abstract class HomeLocalDataSource {
  // * Fetch All Books
  List<BookEntity> fetchCategoryHomeBooks(
      {int pageNumber = 0, int listCategoryIndex});
  // * Fetch New Free Programming Books
  List<BookEntity> fetchNewsBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchCategoryHomeBooks(
      {int pageNumber = 0, int? listCategoryIndex}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    Box<BookEntity> box = Hive.box<BookEntity>(listCategoryIndex.toString());
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewsBooks() {
    var box = Hive.box<BookEntity>(AppHiveKey.featNewFreeProgramBooks);
    return box.values.toList();
  }
}
