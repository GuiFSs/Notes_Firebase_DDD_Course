import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_firebase_DDD_course/core/usecase.dart';
import 'package:notes_firebase_DDD_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_DDD_course/domain/auth/value_objects.dart';

class PerformActionOnAuthFacadeWithEmailAndPasswordParams {
  EmailAddress emailAddress;
  Password password;
  Future<Either<AuthFailure, Unit>> Function({
    @required EmailAddress email,
    @required Password password,
  }) forwardCall;
  PerformActionOnAuthFacadeWithEmailAndPasswordParams(
      this.emailAddress, this.password, this.forwardCall);
}

class PerformActionOnAuthFacadeWithEmailAndPassword
    implements
        IUseCase<AuthFailure, Unit,
            PerformActionOnAuthFacadeWithEmailAndPasswordParams> {
  Future<Either<AuthFailure, Unit>> call([params]) async {
    final isEmailValid = params.emailAddress.isValid();
    final isPasswordValid = params.password.isValid();
    Either<AuthFailure, Unit> failureOrSuccess;
    if (isEmailValid && isPasswordValid) {
      failureOrSuccess = await params.forwardCall(
        email: params.emailAddress,
        password: params.password,
      );
      return failureOrSuccess;
    } else {
      return left(AuthFailure.invalidEmailAndPasswordCombination());
    }
  }
}
