// ignore_for_file:  depend_on_referenced_packages
import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../root/app_manager/data/data_source/local/app_manager_local.dart';
import '../state/log_in_bloc.dart';
import '../state/provider/login_params_provider.dart';
import 'screen/login_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  AppManagerLocal local = locator.get<AppManagerLocal>();

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    return ChangeNotifierProvider.value(
      value:  locator.get<LoginParamProvider>(),
      child: Consumer<LoginParamProvider>(builder: (context, value, child) {
        return BlocProvider(
          create: (context) => locator.get<LoginBloc>(),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) async {
              final bloc = BlocProvider.of<LoginBloc>(context);
              if (state.logInState.isSuccess()) {
                showSnackBar(
                  message: ("logged_success").tr(context),
                  context: context,
                  icon: Icons.check,
                );

                if (state.logInState.model!.accessToken != null) {
                  var clientCode=locator.get<AppManagerLocal>().getCustomer()?.data?.cLIENTCODE??"";
                  locator
                      .get<AppManagerLocal>()
                      .saveClientCode(clientCode);
                  await Future.delayed(
                    const Duration(milliseconds: 750),
                        () {},
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutesNames.rootScreenView, (route) => false);
                } else {
                  showSnackBar(
                    message: ('logged_fail').tr(context),
                    context: context,
                    icon: Icons.warning_amber,
                  );
                }
              }

              if (state.logInState.isFail()) {
                log('message ${state.logInState.error}');
                log('message ${state.logInState.error.toString()}');
                log('message ${AppStrings.strPasswordMustChange}');
                showSnackBar(
                  message:
                  state.logInState.error ?? ('logged_fail').tr(context),
                  context: context,
                  icon: Icons.warning_amber,
                );
                if (state.logInState.error.toString() ==
                    AppStrings.strPasswordMustChange) {
                  await Future.delayed(const Duration(seconds: 1), () {});
                  Navigator.pushNamed(context, Routes.resetPassSection);
                } else {
                  showSnackBar(
                    message:
                    state.logInState.error ?? ('logged_fail').tr(context),
                    context: context,
                    icon: Icons.warning_amber,
                  );
                }
              }
            },
            builder: (context, state) {
              return LoginScreen(bloc: BlocProvider.of<LoginBloc>(context), nameCustomer: args,);
            },
          ),
        );
      }),
    );
  }
}
