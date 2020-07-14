import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_DDD_course/core/usecase.dart';
import 'package:notes_firebase_DDD_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_DDD_course/domain/auth/i_auth_facade.dart';

@injectable
class SignInWithGoogle implements IUseCase<AuthFailure, Unit, Unit> {
  final IAuthFacade _authFacade;

  SignInWithGoogle(this._authFacade);

  @override
  Future<Either<AuthFailure, Unit>> call([_]) async {
    return _authFacade.signInWithGoogle();
  }
}
