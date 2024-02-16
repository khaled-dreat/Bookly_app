import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/constant/app_failure.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFavoriteBooks(
      {int id, String image});
}
