// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'sign_in_form_usecase.freezed.dart';

// @freezed
// abstract class SignInFormEvent with _$SignInFormEvent{
//   const factory SignInFormEvent.emailChanged() = EmailChanged;
//   const factory SignInFormEvent.passwordChanged() = PasswordChanged;
//   const factory SignInFormEvent.registerWithEmailAndPasswordPressed() = RegisterWithEmailAndPasswordPressed;
//   const factory SignInFormEvent.signInWithEmailAndPasswordPressed() = SignInWithEmailAndPasswordPressed;
//   const factory SignInFormEvent.signInWithGooglePressed() = SignInWithGooglePressed;

// }

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/register_with_email_and_password.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/signIn_with_email_and_password.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/usecases/sign_in_with_google.dart';
import 'package:notes_firebase_DDD_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_DDD_course/domain/auth/value_objects.dart';

import 'core/email_password_params.dart';
part 'sign_in_form_view_model.g.dart';

class SignInFormViewModel = _SignInFormViewModelBase with _$SignInFormViewModel;

abstract class _SignInFormViewModelBase with Store {
  final RegisterWithEmailAndPassword _registerWithEmailAndPassword;
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  final SignInWithGoogle _signInWithGoogle;

  _SignInFormViewModelBase(
    this._registerWithEmailAndPassword,
    this._signInWithEmailAndPassword,
    this._signInWithGoogle,
  );

  @observable
  EmailAddress _emailAddress = EmailAddress('');

  @action
  void setEmailAddress(EmailAddress value) {
    _emailAddress = value;
    _authFailureOrSuccess = none();
  }

  EmailAddress get emailAddress => _emailAddress;

  @observable
  Password _password = Password('');
  void setPassword(Password value) {
    _password = value;
    _authFailureOrSuccess = none();
  }

  Password get password => _password;

  @observable
  bool _isSubmitting = false;

  @observable
  bool _showErrorMessage = false;
  void setShowErrorMessage(bool value) => _showErrorMessage = value;
  bool get showErrorMessage => _showErrorMessage;

  @observable
  Option<Either<AuthFailure, Unit>> _authFailureOrSuccess = none();

  @action
  Future<void> registerWithEmailAndPasswordPressed() async {
    await _performActionOnAuthFacadeWithEmailAndPassword(
        _registerWithEmailAndPassword);
  }

  @action
  Future<void> signInWithEmailAndPasswordPressed() async {
    await _performActionOnAuthFacadeWithEmailAndPassword(
        _signInWithEmailAndPassword);
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function([EmailPasswordParams params])
        forwardCall,
  ) async {
    _isSubmitting = true;
    _authFailureOrSuccess = none();
    final failureOrSuccess = await forwardCall(
      EmailPasswordParams(_emailAddress, _password),
    );
    _isSubmitting = false;
    if (failureOrSuccess.isLeft()) {
      _showErrorMessage = true;
    }
    _authFailureOrSuccess = optionOf(failureOrSuccess);
  }

  @action
  Future<void> signInWithGooglePressed() async {
    _isSubmitting = true;
    _authFailureOrSuccess = none();
    final failureOrSuccess = await _signInWithGoogle();
    _isSubmitting = false;
    _authFailureOrSuccess = some(failureOrSuccess);
  }
}
