import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser({required String email, required String password}) async {
    try {
  emit(LoginLoading());
  UserCredential user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  emit(LoginSuccess(user.user!.email));
    }
   on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    emit(LoginFailure('No user found for that email.'));
  } else if (e.code == 'wrong-password') {
    emit(LoginFailure('Wrong password provided for that user.'));
  }
  else {
    emit(LoginFailure(e.toString()));
  }
} catch (e) {
  emit(LoginFailure('An unknown error occurred'));
}
  }
}
