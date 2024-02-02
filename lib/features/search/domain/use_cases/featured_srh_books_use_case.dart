import 'package:clean_arch_bookly_app/core/usecase/use_case.dart';
import 'package:clean_arch_bookly_app/core/utils/constant/app_failure.dart';
import 'package:clean_arch_bookly_app/features/search/domain/entity/srh_book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repo/srh_repo.dart';
import 'package:dartz/dartz.dart';

class FeaturedSrhBooksUseCase extends UseCase<List<SrhBookEntity>, int> {
  final SrhBooksRepo srhBooksRepo;

  FeaturedSrhBooksUseCase({required this.srhBooksRepo});

  @override
  Future<Either<Failure, List<SrhBookEntity>>> call(
      [int param = 0, String? srhKey]) async {
    return await srhBooksRepo.featuredSrhBooks(
        pageNumber: param, srhKey: srhKey);
  }
}
