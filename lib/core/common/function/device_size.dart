// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

int deviceSize(BuildContext context) {
  if (MediaQuery.sizeOf(context).width > 1025) {
    return 0;
  } else if (MediaQuery.sizeOf(context).width >= 800) {
    return 1;
  } else
    return 2;
}

