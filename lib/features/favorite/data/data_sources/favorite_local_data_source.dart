import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

abstract class FavoriteLocalDataSource {
  List<BookEntity> fetchFavoriteBooks({int id = 0, String image});
}

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  @override
  List<BookEntity> fetchFavoriteBooks({int id = 0, String? image}) {
    Box<BookEntity> box = Hive.box<BookEntity>("AppHiveKey.1");
    return box.values.toList();
  }
}
