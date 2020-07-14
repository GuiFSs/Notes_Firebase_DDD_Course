import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_firebase_DDD_course/application/auth/sign_in_form/sign_in_form_view_model.dart';

class SignInForm extends StatelessWidget {
  final SignInFormViewModel signInFormViewModel;

  const SignInForm(this.signInFormViewModel);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Form(
          autovalidate: signInFormViewModel.showErrorMessage,
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              const Text(
                '📝',
                style: TextStyle(fontSize: 130),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) =>
                    signInFormViewModel.setEmailAddress(value),
                validator: (_) => signInFormViewModel.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                onChanged: (value) => signInFormViewModel.setPassword(value),
                validator: (_) => signInFormViewModel.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => 'Short Password',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed:
                          signInFormViewModel.signInWithEmailAndPasswordPressed,
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: signInFormViewModel
                          .registerWithEmailAndPasswordPressed,
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: signInFormViewModel.signInWithGooglePressed,
                color: Colors.lightBlue,
                child: Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
