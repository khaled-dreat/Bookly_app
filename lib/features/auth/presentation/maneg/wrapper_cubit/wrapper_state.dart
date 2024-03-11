part of 'wrapper_cubit.dart';

@immutable
class WrapperState {}

class WrapperInitial extends WrapperState {}

class WrapperSuccess extends WrapperState {
  final Stream<User?> currentUsers;

  WrapperSuccess({required this.currentUsers});
}

class WrapperFailure extends WrapperState {
  final String errMessage;

  WrapperFailure({required this.errMessage});
}
