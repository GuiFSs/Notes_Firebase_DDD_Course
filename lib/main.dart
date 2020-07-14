import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_DDD_course/injection.dart';
import 'package:notes_firebase_DDD_course/presentation/core/app_widget.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(App());
}
