part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class FetchNotification extends NotificationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateNotifierRead extends NotificationEvent {
  String? isRead;
  String? id;

  UpdateNotifierRead({this.isRead, this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id, isRead];
}

class UnReadNotification extends NotificationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchNotificationType extends NotificationEvent {
  @override
  List<Object?> get props => [];
}


class SaveNotificationType extends NotificationEvent {
  final SaveNotificationParams saveNotificationParams;

  const SaveNotificationType({
    required this.saveNotificationParams,
  });

  @override
  List<Object?> get props => [
    saveNotificationParams,
  ];
}

class GetUserNotificationType extends NotificationEvent {

  @override
  List<Object?> get props => [];
}

