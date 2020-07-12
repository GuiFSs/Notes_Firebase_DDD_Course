import 'package:dartz/dartz.dart';
import 'package:notes_firebase_DDD_course/core/usecase.dart';
import 'package:notes_firebase_DDD_course/domain/auth/i_auth_facade.dart';

class SignInWithGoogle implements IUseCase {
  IAuthFacade _authFacade;

  @override
  Future<Either> call([params]) async {
    return await _authFacade.signInWithGoogle();
  }
}
