import 'package:notes_firebase_DDD_course/domain/auth/value_objects.dart';

class EmailPasswordParams {
  EmailAddress emailAddress;
  Password password;
  EmailPasswordParams(
    this.emailAddress,
    this.password,
  );
}
