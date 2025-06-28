// import 'dart:async';
//
// import 'package:ct_ses_connect/core/error/src/exceptions.dart';
// import 'package:flutter/foundation.dart';
// import 'package:logger/logger.dart';
//
// typedef FailCallBack = void Function(Failure fail);
//
// sealed class Result<E> {
//   const Result();
//
//   isSuccess() => this is Success;
//
//   isFail() => this is Failure;
//
//   void fold(void Function(Success<E> suc) suc, FailCallBack fail) {
//     if (this is Success) {
//       suc(this as Success<E>);
//     } else if (this is Failure) {
//       fail(this as Failure);
//     }
//   }
//
//   T foldValue<T>(T Function(Success<E> suc) success,
//       T Function(Failure fail) failure) {
//     if (this is Success<E>) {
//       return success(this as Success<E>);
//     } else if (this is Failure) {
//       return failure(this as Failure);
//     }
//     throw Exception('Unexpected Result state');
//   }
//
//   E get successVal => (this as Success<E>).value;
//
//   String  get failVal => (this as Failure).message;
// }
//
// final class Success<S> extends Result<S> {
//   const Success(this.value);
//
//   final S value;
// }
//
// final class Failure<E extends AppException> extends Result<E> {
//   const Failure(this.exception);
//
//   final AppException exception;
//
//   String get message => exception.message;
// }
//
// FutureOr<Result<U>> handleCalls<U>(
//     FutureOr<U> Function() call) async {
//   try {
//     return Success<U>(await call());
//   } on AppException catch (e, s) {
//     Logger().e(e);
//     Logger().e(s);
//     return Failure(e);
//   } catch (e, s) {
//     Logger().e(e);
//     Logger().e(s);
//     return Failure(AppException.unknown());
//   }
// }
//
// Stream<Result<U>> handleCallsStream<U>(
//   Stream<U> Function() call, {
//   void Function(Failure failure)? onFailure,
// }) async* {
//   try {
//     // Access the stream returned by the call function
//     await for (final event in call()) {
//       yield Success<U>(event); // Emit success result
//     }
//   } on AppException catch (e, s) {
//     debugPrint('${e.toString()} ${s.toString()}');
//     final Failure<AppException> failure = Failure(e);
//     if (onFailure != null) onFailure(failure);
//     yield Failure(e); // Emit failure result for AppException
//   } catch (e, s) {
//     debugPrint('${e.toString()} ${s.toString()}');
//     final failure = Failure(AppException.unknown());
//     if (onFailure != null) onFailure(failure);
//     yield Failure(AppException
//         .unknown()); // Emit failure result for unknown exceptions
//   }
// }