part of 'auth_cubit.dart';

@immutable
class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure({required this.errMessage});
}

class AuthSuccess extends AuthState {}

class AuthisNotShowPass extends AuthState {
  final bool isNotShowPass;

  AuthisNotShowPass({required this.isNotShowPass});
}
