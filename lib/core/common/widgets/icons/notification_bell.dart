import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/config/theme/src/colors.dart';
import '../../../../feature/notification/presesnation/state/notification_bloc.dart';
import '../../../injection/injection.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});



  @override
  Widget build(BuildContext context) {
  int notificationCount = 0;
    return BlocProvider(
      create: (context) =>
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
