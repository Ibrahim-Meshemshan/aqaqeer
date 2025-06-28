import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/injection/injection.dart';
import '../../state/notification_bloc.dart';

class NotificationIcon extends StatefulWidget {
  NotificationIcon({
    super.key,
  });

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<NotificationBloc>()..add(UnReadNotification()),
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                child: const Icon(
                  Iconsax.notification,
                  color: AppColors.black,
                  size: 37.0,
                ),
              ),
              if ('0' == state.unReadNotification.model.toString() ||
                  "" == state.unReadNotification.model.toString())
                const SizedBox()
              else
                Positioned(
                  right: 0,
                  top: 1.0,
                  left: 15,
                  child: Container(
                    // height: 20.0.h,
                    // width: 50.0.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: Text(
                      state.unReadNotification.model.toString(),
                      style: CustomTextStyle.bodyLarge(
                        context,
                        fontWeight: FontWeight.bold,
                      )!
                          .copyWith(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
