import '../../../../core/utils/local_data/app_local_data_key.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/utils/local_data/save_books_local_data.dart';
import '../../domain/entity/book_entity.dart';

abstract class FavoriteRemoteDataSource {
  // * Fetch All Books
  Future<List<BookFavoriteEntity>> fetchFavoriteBooks(
      {int id = 0, String image});
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiService apiService;

  FavoriteRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookFavoriteEntity>> fetchFavoriteBooks(
      {int id = 0, String? image}) {
    // TODO: implement fetchFavoriteBooks
    throw UnimplementedError();
  }
}
