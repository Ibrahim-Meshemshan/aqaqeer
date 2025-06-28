// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/config/theme/src/colors.dart';
import '../../../../core/injection/injection.dart';
import '../state/notification_bloc.dart';

class NotificationIcon extends StatelessWidget {
  NotificationIcon({super.key});

  int notificationCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:
          locator.get<NotificationBloc>()..add(UnReadNotification()),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          notificationCount = int.parse(state.unReadNotification.model ?? '0');

          return notificationCount > 0
              ? Badge.count(
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  count: notificationCount,
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: AppColors.black,
                    size: 32.0,
                  ),
                )
              : const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.black,
                  size: 32.0,
                );
        },
      ),
    );
  }
}
