import 'package:clean_arch_bookly_app/features/favorite/data/data_sources/favorite_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/favorite/data/data_sources/favorite_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/repo/repo_favorite.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_failure.dart';

import 'package:dartz/dartz.dart';

class FavoriteRepoEmpl extends FavoriteRepo {
  final FavoriteLocalDataSource favoriteLocalDataSource;
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoEmpl(
      {required this.favoriteLocalDataSource,
      required this.favoriteRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFavoriteBooks(
      {int? id, String? image}) async {
    try {
      List<BookEntity> books;
      books =
          favoriteLocalDataSource.fetchFavoriteBooks(id: id!, image: image!);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
