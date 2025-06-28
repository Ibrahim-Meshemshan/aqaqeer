import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/feature/notification/presesnation/ui/widget/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/config/theme/src/colors.dart';
import '../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/common/widgets/circular_progress/custom_circular_progress.dart';
import '../../../../core/common/widgets/custom_placeholder.dart';
import '../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../core/injection/injection.dart';
import '../../../../resources/assets.gen.dart';
import '../../data/model/notification_model.dart';
import '../state/notification_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:
      locator.get<NotificationBloc>()..add(FetchNotification()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: ('notifier').tr(context),
          icon: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(
                  //   Routes.notificationType,
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: const Icon(
                    Icons.settings_outlined,
                    color: AppColors.black,
                    size: 22,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryGray,
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) async {
            if (state.notifierStatus.isFail()) {
              await Future.delayed(const Duration(milliseconds: 750), () {});
              log('the error on the snack is ${state.notifierStatus.error}');
              showSnackBar(
                message: state.notifierStatus.error??"",
                context: context,
                icon: Icons.warning_amber,
              );
            }
          },
          builder: (context, state) {
            if (state.notifierStatus.isLoading()) {
              return const CustomCircularProgress();
            } else if (state.notifierStatus.isSuccess()) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 2), () {
                    context.read<NotificationBloc>().add(FetchNotification());
                  });
                },
                child: state.notifierStatus.model!.data!.isEmpty
                    ? CustomPlaceholder(
                  image: Assets.icons.notifications,
                  message: ("no_notifications").tr(context),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        itemBuilder: (context, index) {
                          DataNotifier? dataNotifier =
                          state.notifierStatus.model!.data?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: NotificationItem(
                                dataNotifier: dataNotifier),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 12,
                          );
                        },
                        itemCount:
                        state.notifierStatus.model!.data?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
