import '../../../../core/utils/constant/app_failure.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';
import '../../domain/entity/book_entity.dart';
import '../../domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoEmpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoEmpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchCategoryHomeBooks(
      {int pageNumber = 0,
      int? listCategoryIndex,
      String? categoryTitle}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchCategoryHomeBooks(
          pageNumber: pageNumber, listCategoryIndex: listCategoryIndex!);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchCategoryHomeBooks(
          pageNumber: pageNumber,
          categoryTitle: categoryTitle!,
          listCategoryIndex: listCategoryIndex);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookEntity>> fetchBooksDetails(
      {required String? id}) async {
    try {
      BookEntity book;
      book = await homeRemoteDataSource.fetchBooksDetails(id: id!);

      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewsBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchAlsoLikeBook(
      {required String? author}) async {
    try {
      List<BookEntity> books;
      books = await homeRemoteDataSource.fetchAlsoLikeBook(author: author);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
