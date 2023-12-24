import 'package:dartz/dartz.dart';

import '../../../../core/utils/constant/app_failure.dart';
import '../entity/srh_book_entity.dart';

abstract class SrhBooksRepo {
  Future<Either<Failure, List<SrhBookEntity>>> featuredSrhBooks(
      {int pageNumber = 0});
}
