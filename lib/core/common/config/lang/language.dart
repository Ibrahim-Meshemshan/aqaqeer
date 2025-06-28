import 'package:flutter/material.dart';

enum Language{

  english(Locale('en')),

  arabic(Locale('ar'));

  const Language(this.value);
  final Locale value;
}