part of 'app_manager_bloc.dart';

abstract class AppManagerEvent extends Equatable {
  const AppManagerEvent();
}

class SaveFcmTokenEvent extends AppManagerEvent {
  SaveFcmTokenParams saveFcmTokenParams;

  SaveFcmTokenEvent({required this.saveFcmTokenParams});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteFcmTokenEvent extends AppManagerEvent {
  String fcmToken;

  DeleteFcmTokenEvent({
    required this.fcmToken,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAppInfo extends AppManagerEvent {
  final String clientCode;
  const GetAppInfo({required this.clientCode});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetPermissions extends AppManagerEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class SendError extends AppManagerEvent {
  final ErrorParam errorParam;

  const SendError({required this.errorParam});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
