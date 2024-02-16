import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../core/utils/constant/app_failure.dart';
import '../repo/repo_favorite.dart';

class FetchFavoriteBooksUseCase extends UseCase<List<BookEntity>, int> {
  final FavoriteRepo favoriteRepo;

  FetchFavoriteBooksUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int param = 0, String? image]) async {
    return await favoriteRepo.fetchFavoriteBooks(
      id: param,
      image: image!,
    );
  }
}
