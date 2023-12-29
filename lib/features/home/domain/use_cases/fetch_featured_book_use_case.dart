import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../core/utils/constant/app_failure.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}
