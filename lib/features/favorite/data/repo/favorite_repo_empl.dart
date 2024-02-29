import 'package:clean_arch_bookly_app/features/favorite/data/data_sources/favorite_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/favorite/data/data_sources/favorite_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/repo/repo_favorite.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_failure.dart';

import 'package:dartz/dartz.dart';

class FavoriteRepoEmpl extends FavoriteRepo {
  // final FavoriteLocalDataSource favoriteLocalDataSource;
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoEmpl(
      {
      //required this.favoriteLocalDataSource,
      required this.favoriteRemoteDataSource});

  @override
  Future<Either<Failure, void>> addFavoriteBooks(
      {FavoriteBookEntity? book}) async {
    try {
      favoriteRemoteDataSource.addFavoriteBooks(book: book!);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteBookEntity>>> fetchFavoriteBooks() {
    // TODO: implement fetchFavoriteBooks
    throw UnimplementedError();
  }
}
