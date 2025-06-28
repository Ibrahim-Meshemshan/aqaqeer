part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  const NotificationState(
      {this.notifierStatus = const BlocStatus(),
        this.updateNotifierStatus = const BlocStatus(),
        this.notificationTypeStatus = const BlocStatus(),
        this.saveNotificationTypeStatus = const BlocStatus(),
        this.getUserNotificationTypeStatus = const BlocStatus(),
        this.unReadNotification = const BlocStatus()});

  final BlocStatus<NotificationModel> notifierStatus;
  final BlocStatus<bool> updateNotifierStatus;
  final BlocStatus<String> unReadNotification;

  final BlocStatus<NotificationTypeModel> notificationTypeStatus;
  final BlocStatus<saveNotificationTypeModel> saveNotificationTypeStatus;
  final BlocStatus<GetUserNotificationTypeModel> getUserNotificationTypeStatus;

  @override
  // TODO: implement props
  List<Object?> get props => [
    notifierStatus,
    updateNotifierStatus,
    unReadNotification,
    notificationTypeStatus,
    saveNotificationTypeStatus,
    getUserNotificationTypeStatus
  ];

  NotificationState copyWith({
    BlocStatus<NotificationModel>? notifierStatus,
    BlocStatus<bool>? updateNotifierStatus,
    BlocStatus<String>? unReadNotification,
    BlocStatus<NotificationTypeModel>? notificationTypeStatus,
    BlocStatus<saveNotificationTypeModel>? saveNotificationTypeStatus,
    BlocStatus<GetUserNotificationTypeModel>? getUserNotificationTypeStatus
  }) {
    return NotificationState(
        notifierStatus: notifierStatus ?? this.notifierStatus,
        updateNotifierStatus: updateNotifierStatus ?? this.updateNotifierStatus,
        unReadNotification: unReadNotification ?? this.unReadNotification,
        notificationTypeStatus: notificationTypeStatus ?? this.notificationTypeStatus,
        saveNotificationTypeStatus: saveNotificationTypeStatus ?? this.saveNotificationTypeStatus,
        getUserNotificationTypeStatus: getUserNotificationTypeStatus ?? this.getUserNotificationTypeStatus

    );

  }

  @override
  String toString() {
    return "FetchAllNotification: $notifierStatus,update :$updateNotifierStatus , unReadNotification :$unReadNotification";
  }
}
