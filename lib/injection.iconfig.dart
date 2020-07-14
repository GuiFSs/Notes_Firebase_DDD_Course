// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:notes_firebase_DDD_course/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_firebase_DDD_course/infrastructure/firebase_auth_facade.dart';
import 'package:notes_firebase_DDD_course/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/perform_action_on_auth_facade_with_email_and_password.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/register_with_email_and_password.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/signIn_with_email_and_password.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/sign_in_with_google.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/sign_in_form_view_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<IAuthFacade>(
      () => FirebaseAuthFacade(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerFactory<PerformActionOnAuthFacadeWithEmailAndPassword>(
      () => PerformActionOnAuthFacadeWithEmailAndPassword());
  g.registerFactory<RegisterWithEmailAndPassword>(() =>
      RegisterWithEmailAndPassword(g<IAuthFacade>(),
          g<PerformActionOnAuthFacadeWithEmailAndPassword>()));
  g.registerFactory<SignInWithEmailAndPassword>(() =>
      SignInWithEmailAndPassword(g<IAuthFacade>(),
          g<PerformActionOnAuthFacadeWithEmailAndPassword>()));
  g.registerFactory<SignInWithGoogle>(() => SignInWithGoogle(g<IAuthFacade>()));
  g.registerFactory<SignInFormViewModel>(() => SignInFormViewModel(
        g<RegisterWithEmailAndPassword>(),
        g<SignInWithEmailAndPassword>(),
        g<SignInWithGoogle>(),
      ));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
