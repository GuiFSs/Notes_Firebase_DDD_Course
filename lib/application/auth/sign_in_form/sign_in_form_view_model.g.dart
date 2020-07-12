// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_form_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInFormViewModel on _SignInFormViewModelBase, Store {
  final _$_emailAddressAtom =
      Atom(name: '_SignInFormViewModelBase._emailAddress');

  @override
  EmailAddress get _emailAddress {
    _$_emailAddressAtom.reportRead();
    return super._emailAddress;
  }

  @override
  set _emailAddress(EmailAddress value) {
    _$_emailAddressAtom.reportWrite(value, super._emailAddress, () {
      super._emailAddress = value;
    });
  }

  final _$_passwordAtom = Atom(name: '_SignInFormViewModelBase._password');

  @override
  Password get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(Password value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  final _$_isSubmittingAtom =
      Atom(name: '_SignInFormViewModelBase._isSubmitting');

  @override
  bool get _isSubmitting {
    _$_isSubmittingAtom.reportRead();
    return super._isSubmitting;
  }

  @override
  set _isSubmitting(bool value) {
    _$_isSubmittingAtom.reportWrite(value, super._isSubmitting, () {
      super._isSubmitting = value;
    });
  }

  final _$_showErrorMessageAtom =
      Atom(name: '_SignInFormViewModelBase._showErrorMessage');

  @override
  bool get _showErrorMessage {
    _$_showErrorMessageAtom.reportRead();
    return super._showErrorMessage;
  }

  @override
  set _showErrorMessage(bool value) {
    _$_showErrorMessageAtom.reportWrite(value, super._showErrorMessage, () {
      super._showErrorMessage = value;
    });
  }

  final _$_authFailureOrSuccessAtom =
      Atom(name: '_SignInFormViewModelBase._authFailureOrSuccess');

  @override
  Option<Either<AuthFailure, Unit>> get _authFailureOrSuccess {
    _$_authFailureOrSuccessAtom.reportRead();
    return super._authFailureOrSuccess;
  }

  @override
  set _authFailureOrSuccess(Option<Either<AuthFailure, Unit>> value) {
    _$_authFailureOrSuccessAtom.reportWrite(value, super._authFailureOrSuccess,
        () {
      super._authFailureOrSuccess = value;
    });
  }

  final _$registerWithEmailAndPasswordPressedAsyncAction = AsyncAction(
      '_SignInFormViewModelBase.registerWithEmailAndPasswordPressed');

  @override
  Future<void> registerWithEmailAndPasswordPressed() {
    return _$registerWithEmailAndPasswordPressedAsyncAction
        .run(() => super.registerWithEmailAndPasswordPressed());
  }

  final _$signInWithEmailAndPasswordPressedAsyncAction =
      AsyncAction('_SignInFormViewModelBase.signInWithEmailAndPasswordPressed');

  @override
  Future<void> signInWithEmailAndPasswordPressed() {
    return _$signInWithEmailAndPasswordPressedAsyncAction
        .run(() => super.signInWithEmailAndPasswordPressed());
  }

  final _$signInWithGooglePressedAsyncAction =
      AsyncAction('_SignInFormViewModelBase.signInWithGooglePressed');

  @override
  Future<void> signInWithGooglePressed() {
    return _$signInWithGooglePressedAsyncAction
        .run(() => super.signInWithGooglePressed());
  }

  final _$_SignInFormViewModelBaseActionController =
      ActionController(name: '_SignInFormViewModelBase');

  @override
  void setEmailAddress(EmailAddress value) {
    final _$actionInfo = _$_SignInFormViewModelBaseActionController.startAction(
        name: '_SignInFormViewModelBase.setEmailAddress');
    try {
      return super.setEmailAddress(value);
    } finally {
      _$_SignInFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
