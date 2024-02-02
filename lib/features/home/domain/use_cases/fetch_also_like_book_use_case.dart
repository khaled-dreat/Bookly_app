import 'package:clean_arch_bookly_app/core/usecase/use_case.dart';
import 'package:clean_arch_bookly_app/core/utils/constant/app_failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class FetchAlsoLikeBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchAlsoLikeBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    return await homeRepo.fetchAlsoLikeBook(author: param);
  }
}
