import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';

import '../../../../core/api/api_service.dart';

abstract class FavoriteRemoteDataSource {
  // * Fetch All Books
  Future<FavoriteBookEntity> addFavoriteBooks({FavoriteBookEntity book});
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiService apiService;

  FavoriteRemoteDataSourceImpl({required this.apiService});

  @override
  Future<FavoriteBookEntity> addFavoriteBooks({FavoriteBookEntity? book}) {
    // TODO: implement fetchFavoriteBooks
    throw UnimplementedError();
  }
}
