import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/constant/app_failure.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, void>> addFavoriteBooks({FavoriteBookEntity book});
  Future<Either<Failure, void>> removeFavoriteBooks({String book});
  Future<Either<Failure, List<FavoriteBookEntity>>> fetchFavoriteBooks();
}
