import 'package:dartz/dartz.dart';

import '../utils/constant/app_failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
