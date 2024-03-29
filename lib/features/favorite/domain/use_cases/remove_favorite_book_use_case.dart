import 'package:dartz/dartz.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../core/utils/constant/app_failure.dart';
import '../repo/repo_favorite.dart';

class RemoveFavoriteBooksUseCase extends UseCase<void, String> {
  final FavoriteRepo favoriteRepo;

  RemoveFavoriteBooksUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, void>> call([String? param]) async {
    return await favoriteRepo.removeFavoriteBooks(bookID: param!);
  }
}
