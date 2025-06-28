import 'package:flutter/material.dart';

extension NavigatorContext on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop();

  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);
}