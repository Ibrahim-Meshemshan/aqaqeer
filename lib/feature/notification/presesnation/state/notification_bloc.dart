import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/bloc_status.dart';
import '../../data/model/get_user_notification_type.dart';
import '../../data/model/notification_model.dart';
import '../../data/model/notification_type_model.dart';
import '../../data/model/save_type_model.dart';
import '../../data/repo/repo_notifier_imp.dart';
import '../../domin/entities/save_notification_type_params.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotifierRepoImp repoImp;

  NotificationBloc({required this.repoImp}) : super(const NotificationState()) {
    on<NotificationEvent>((event, emit) async {
      if (event is FetchNotification) {
        emit(state.copyWith(notifierStatus: BlocStatus.loading()));
        (await repoImp.getNotification()).fold((fail) {
          print('catch error ${fail.message}');
          emit(state.copyWith(
              notifierStatus: BlocStatus.fail(error: fail.message)));
        }, (right) {
          emit(
              state.copyWith(notifierStatus: BlocStatus.success(model: right)));
        });
      }
      if (event is UpdateNotifierRead) {
        (await repoImp.updateNotifierRead(isRead: event.isRead, id: event.id))
            .fold((fail) {
          print('catch error ${fail.message}');
          emit(state.copyWith(
              updateNotifierStatus: BlocStatus.fail(error: fail.message)));
        }, (right) {
          emit(state.copyWith(
              updateNotifierStatus: BlocStatus.success(model: right)));
        });
      }
      if (event is UnReadNotification) {
        (await repoImp.getNotificationState()).fold((left) => null, (right) {
          emit(state.copyWith(
              unReadNotification: BlocStatus.success(
                  model: right.data?.aNNOUNCEMENTUNREADCOUNT ?? '0')));
        });
      }

      if (event is FetchNotificationType) {
        emit(state.copyWith(notificationTypeStatus: BlocStatus.loading()));
        (await repoImp.notificationType()).fold((fail) {
          print('catch error ${fail.message}');
          emit(state.copyWith(
              notificationTypeStatus: BlocStatus.fail(error: fail.message)));
        }, (right) {
          emit(state.copyWith(
              notificationTypeStatus: BlocStatus.success(model: right)));
        });
      }

      if (event is SaveNotificationType) {
        emit(state.copyWith(saveNotificationTypeStatus: BlocStatus.loading()));
        (await repoImp.saveNotificationType(
            saveNotificationParams: event.saveNotificationParams))
            .fold((fail) {
          print('catch error ${fail.message}');
          emit(state.copyWith(
              saveNotificationTypeStatus:
              BlocStatus.fail(error: fail.message)));
        }, (right) {
          emit(state.copyWith(
              saveNotificationTypeStatus: BlocStatus.success(model: right)));
        });
      }

      if (event is GetUserNotificationType) {
        emit(state.copyWith(
            getUserNotificationTypeStatus: BlocStatus.loading()));
        (await repoImp.getUserNotificationType()).fold((fail) {
          print('catch error ${fail.message}');
          emit(state.copyWith(
              getUserNotificationTypeStatus:
              BlocStatus.fail(error: fail.message)));
        }, (right) {
          emit(state.copyWith(
              getUserNotificationTypeStatus: BlocStatus.success(model: right)));
        });
      }
    });
  }
}
