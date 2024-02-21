part of 'wrapper_cubit.dart';

@immutable
sealed class WrapperState {}

final class WrapperInitial extends WrapperState {}

final class WrapperSuccess extends WrapperState {
  final Stream<User?> currentUsers;

  WrapperSuccess({required this.currentUsers});
}

final class WrapperFailure extends WrapperState {
  final String errMessage;

  WrapperFailure({required this.errMessage});
}
