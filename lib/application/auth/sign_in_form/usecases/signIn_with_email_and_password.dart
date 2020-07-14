import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/core/email_password_params.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/perform_action_on_auth_facade_with_email_and_password.dart';
import 'package:notes_firebase_DDD_course/core/usecase.dart';
import 'package:notes_firebase_DDD_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_DDD_course/domain/auth/i_auth_facade.dart';

@injectable
class SignInWithEmailAndPassword
    implements IUseCase<AuthFailure, Unit, EmailPasswordParams> {
  final IAuthFacade _authFacade;
  final PerformActionOnAuthFacadeWithEmailAndPassword
      _performActionOnAuthFacadeWithEmailAndPassword;
  SignInWithEmailAndPassword(
    this._authFacade,
    this._performActionOnAuthFacadeWithEmailAndPassword,
  );

  @override
  Future<Either<AuthFailure, Unit>> call([EmailPasswordParams params]) {
    return _performActionOnAuthFacadeWithEmailAndPassword(
        PerformActionOnAuthFacadeWithEmailAndPasswordParams(
      params.emailAddress,
      params.password,
      _authFacade.signInWithEmailAndPassword,
    ));
  }
}
