import 'package:flutter/material.dart';

class RequiredFieldIcon extends StatelessWidget {
  const RequiredFieldIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '*',
      style: TextStyle(color: Colors.redAccent, fontSize: 20),
    );
  }
}
