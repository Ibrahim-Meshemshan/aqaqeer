import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/injection/injection.dart';
import '../../state/bloc/sign_up_bloc.dart';
import 'OTP_screen.dart';

class OtpParentScreen extends StatelessWidget {
  const OtpParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<SignUpBloc>(),
      child: OTPScreen(),
    );
  }
}
