import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../core/utils/constant/app_failure.dart';
import '../repo/repo_favorite.dart';

class AddFavoriteBooksUseCase extends UseCase<void, FavoriteBookEntity> {
  final FavoriteRepo favoriteRepo;

  AddFavoriteBooksUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, void>> call([FavoriteBookEntity? param]) async {
    return await favoriteRepo.addFavoriteBooks(book: param!);
  }
}
