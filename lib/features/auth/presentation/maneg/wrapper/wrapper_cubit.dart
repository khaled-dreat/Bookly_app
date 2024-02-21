import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'wrapper_state.dart';

class WrapperCubit extends Cubit<WrapperState> {
  WrapperCubit() : super(WrapperInitial());
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> currentUserState() async {
    try {
      emit(WrapperSuccess(currentUsers: firebaseAuth.authStateChanges()));
    } catch (e) {
      WrapperFailure(errMessage: e.toString());
    }
  }
}
