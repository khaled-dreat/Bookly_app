import 'package:clean_arch_bookly_app/core/utils/constant/app_failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecase/use_case.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class FetchFeaturedBooksDeailsUseCase extends UseCase<BookEntity, String> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksDeailsUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, BookEntity>> call([String? param]) async {
    return await homeRepo.fetchBooksDetails(id: param);
  }
}
