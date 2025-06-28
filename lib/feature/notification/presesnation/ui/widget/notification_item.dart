import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../resources/assets.gen.dart';
import '../../../data/model/notification_model.dart';
import '../../state/notification_bloc.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, this.dataNotifier});

  final DataNotifier? dataNotifier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NotificationBloc>().add(UpdateNotifierRead(
            isRead: 'Y', id: dataNotifier?.aNNOUNCEMENTHISTOID));
        // context.read<NotificationBloc>().add(FetchNotification());
        dataNotifier!.iSREAD = 'Y';
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Main shadow color
              spreadRadius: 2, // Slightly increases the shadow area
              blurRadius: 3, // Increases the blur for a smoother shadow
              offset: const Offset(0, 2), // Elevation effect
            ),
          ],
          color: (dataNotifier!.iSREAD == 'N')
              ? AppColors.secondaryColor.withOpacity(.9)
              : AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),

            Container(
              width: 64, // Adjust the size based on the radius + border width
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor, // Border color
                  width: 1, // Border width
                ),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.transparent,
                // Background for the avatar
                child: ClipOval(
                  child: Image.network(
                    AppUrl.baseUrl
                        .split('api')
                        .join(dataNotifier!.aNNOUNCEMENTLOGOPATH ?? ''),
                    fit: BoxFit.cover,
                    width: 56, // Adjust size according to radius * 2
                    height: 56,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to foreground image (icon) if the URL fails
                      return Image.asset(
                        Assets.icons.bell.path,
                        fit: BoxFit.contain,
                        width: 40,
                        height: 40,
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(
              width: 10, // Spacing between avatar and text
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: dataNotifier!.aNNOUNCEMENTTITLE ?? '',

                      fontWeight: FontWeight.bold,
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  HtmlWidget(
                    dataNotifier?.aNNOUNCEMENTBODY ?? '',
                    textStyle: CustomTextStyle.titleSmall(context)?.copyWith(
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Spacing between divider and date

                  // Align(
                  //   alignment: AlignmentDirectional.bottomEnd,
                  //   child: Container(
                  //     width: (dataNotifier?.aNNOUNCEDATE?.length ?? 0) * 7.0, // Approximation: 7 pixels per character
                  //     height: 1,
                  //     color: AppColors.primaryColor,
                  //   ),
                  // ),
                  const SizedBox(height: 5),
                  // Spacing between divider and date
                  // Displaying the date
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: CustomText(
                      text: dataNotifier?.aNNOUNCEDATE ?? '',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  // style: CustomTextStyle.titleSmall(context)?.copyWith(
                  //   height: 1.5,
                  // ),
                  // maxLines: 5,
                  // ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            // Column(
            //   children: [
            //     // Divider with the same length as the date text
            //     // Container(
            //     //   width: (dataNotifier?.aNNOUNCEDATE?.length ?? 0) * 7.0, // Approximation: 7 pixels per character
            //     //   height: 1,
            //     //   color: AppColors.primaryColor,
            //     // ),
            //     const SizedBox(height: 5), // Spacing between divider and date
            //     // Displaying the date
            //     CustomText(
            //       text: dataNotifier?.aNNOUNCEDATE ?? '',
            //       style: CustomTextStyle.titleSmall(context)?.copyWith(
            //         fontWeight: FontWeight.w400,
            //         fontSize: 12,
            //         // color: AppColors.gray,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
