import 'package:dartz/dartz.dart' as dartz;
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/sign_in_form_view_model.dart';
import 'package:notes_firebase_DDD_course/domain/auth/auth_failure.dart';

import 'package:notes_firebase_DDD_course/injection.dart';
import 'package:notes_firebase_DDD_course/presentation/sign_in/widgets/sign_in_form.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<ReactionDisposer> _disposers;
  final _signInFormViewModel = getIt<SignInFormViewModel>();

  @override
  void initState() {
    super.initState();
    _disposers = [
      reaction<dartz.Either<AuthFailure, dartz.Unit>>(
        (_) => _signInFormViewModel.authFailureOrSuccess.fold(
          () => null,
          (either) => either,
        ),
        (either) => either.fold(
          (failure) => FlushbarHelper.createError(
            message: failure.map(
              cancelledByUser: (_) => 'Cancelled',
              serverError: (_) => 'Server error',
              emailAlreadyInUse: (_) => 'Email already in use',
              invalidEmailAndPasswordCombination: (_) =>
                  'Invalid email and password combination',
            ),
          ).show(context),
          (_) {
            // TODO: Navigate to app
          },
        ),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    for (final disposable in _disposers) {
      disposable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SignInForm(_signInFormViewModel),
    );
  }
}
