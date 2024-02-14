import 'package:dartz/dartz.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../core/utils/constant/app_failure.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class FetchCategoryHomeBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchCategoryHomeBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int param = 0, int? listCategoryIndex, String? categoryTitle]) async {
    return await homeRepo.fetchCategoryHomeBooks(
        pageNumber: param,
        categoryTitle: categoryTitle!,
        listCategoryIndex: listCategoryIndex!);
  }
}
