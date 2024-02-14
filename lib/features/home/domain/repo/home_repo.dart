import 'package:dartz/dartz.dart';
import '../../../../core/utils/constant/app_failure.dart';
import '../entity/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchCategoryHomeBooks(
      {int pageNumber = 0, int listCategoryIndex, String categoryTitle});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, BookEntity>> fetchBooksDetails({required String? id});
  Future<Either<Failure, List<BookEntity>>> fetchAlsoLikeBook(
      {required String? author});
}
