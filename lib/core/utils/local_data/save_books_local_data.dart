import 'package:hive/hive.dart';

import '../../../features/home/domain/entity/book_entity.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
