import '../../../../core/utils/local_data/app_local_data_key.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/book_entity.dart';

abstract class FavoriteLocalDataSource {
  List<BookFavoriteEntity> fetchFavoriteBooks({int id = 0, String image});
}

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  @override
  List<BookFavoriteEntity> fetchFavoriteBooks({int id = 0, String? image}) {
    Box<BookFavoriteEntity> box = Hive.box<BookFavoriteEntity>("AppHiveKey.1");
    return box.values.toList();
  }
}
