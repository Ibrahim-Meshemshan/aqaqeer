// import 'dart:developer';
// import '../../../feature/auth/data/data_source/local/local.dart';
// import '../../../feature/auth/domain/entities/login_params.dart';
// import '../../../feature/auth/presentation/login/state/log_in_bloc.dart';
// import '../../injection/injection.dart';
//
// Future<void> reAuth() async {
//   // Access LogInBloc without passing it as a parameter
//   final logInBloc = locator.get<LoginBloc>();
//
//   // Dispatch the Login event with predefined login parameters
//   final loginParams =  LoginParams(
//       userName: locator.get<AuthLocal>().getAuthUserName(),
//       // rememberToken: locator
//       //     .get<AuthLocal>()
//       //     .getRememberToken());
//   // logInBloc.add(Login(loginParams: loginParams));
//
//   // Listen for state changes in the bloc
//   // final subscription = logInBloc.stream.listen((state) {
//   //   if (state.logInState.isLoading()) {
//   //     log('Login state: Loading');
//   //   } else if (state.logInState.isSuccess()) {
//   //     final user = (state.logInState.model!.data);
//   //     log('Login state: Success - User: ${user!.uSERNAME}');
//   //   } else if (state.logInState.isFail()) {
//   //     final error = (state.logInState.error);
//   //     // logOutAndClearVariable();
//   //
//   //     log('Login state: Failure - Error: $error');
//   //   }
//   // });
//
//   // await Future.delayed(const Duration(seconds: 2));
//   // await subscription.cancel(); // Clean up the subscription
// }
