import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_firebase_DDD_course/domain/auth/auth_failure.dart';

import 'value_objects.dart';

// Facade is a design pattern for connecting two or more classes with weird interfaces into just one simplified interface. In our case, it will connect FirebaseAuth and GoogleSignIn.
// more about Facade pattern https://en.wikipedia.org/wiki/Facade_pattern

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
