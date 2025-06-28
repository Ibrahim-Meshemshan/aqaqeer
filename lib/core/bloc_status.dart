import 'dart:core';

enum Status { initial, loading, success, fail,  }

class BlocStatus<T> {
  final Status status;

 const  BlocStatus({this.status = Status.initial})
      : error = null,
        model = null;
  final String? error;
   final T? model;

  BlocStatus.loading()
      : status = Status.loading,
        error = null,
        model = null;

  BlocStatus.success({this.model})
      : status = Status.success,
        error = null;

  BlocStatus.fail({required this.error})
      : status = Status.fail,
        model = null;

  BlocStatus.initial()
      : status = Status.initial,
        error = null,
        model = null;

  bool isLoading() => status == Status.loading;

  bool isInitial() => status == Status.initial;

  bool isFail() => status == Status.fail;

  bool isSuccess() => status == Status.success;

  @override
  String toString() {
    return status.name;
  }
}
