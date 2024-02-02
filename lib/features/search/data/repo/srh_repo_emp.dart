import 'package:clean_arch_bookly_app/core/utils/constant/app_failure.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_source/srh_books_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/domain/entity/srh_book_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repo/srh_repo.dart';

class SrhRepoEmpl extends SrhBooksRepo {
  final SrhBooksRemoteDataSource srhBooksRemoteDataSource;

  SrhRepoEmpl({required this.srhBooksRemoteDataSource});
  @override
  Future<Either<Failure, List<SrhBookEntity>>> featuredSrhBooks(
      {int pageNumber = 0, String? srhKey}) async {
    List<SrhBookEntity> booksList;
    try {
      booksList = await srhBooksRemoteDataSource.fechSrhBooks(
          pageNumber: pageNumber, srhKey: srhKey);

      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
