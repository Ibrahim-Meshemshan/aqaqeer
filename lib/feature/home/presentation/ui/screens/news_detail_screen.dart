import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../resources/assets.gen.dart';

class NewsDetailScreen extends StatelessWidget {
  final int newsIndex;
  final bool isAppNews;

  const NewsDetailScreen({
    super.key,
    required this.newsIndex,
    this.isAppNews = false,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تفاصيل الخبر',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.primaryGray,
      body: Padding(
        padding: const EdgeInsets.all(10),
        // child: BlocBuilder<HomeBloc, HomeState>(
        //   builder: (context, state) {
        //     if (state.newsDetailState.isLoading()) {
        //       return const Center(child: LoaderWidget());
        //     }
        //     if (state.newsDetailState.isSuccess()) {
        //       final newsData = state.newsDetailState.model?.data;
        child: SingleChildScrollView(
          child: SizedBox(
            width: getWidthScreen(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  //newsData?.title ??
                  text: "عنوان الخبر",
                  style: CustomTextStyle.headlineMedium(context),
                ),
                const SizedBox(height: 10),

                // Image from API
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: AppColors.primaryGray,
                      width:
                          isAppNews
                              ? getWidthScreen(context) / 2
                              : getWidthScreen(context) - 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        /*newsData?.imagePath != null
                                  ? secureNetworkImage(
                                      url: AppUrl.baseUrl.split('api').join(
                                            newsData?.imagePath ?? '',
                                          ),
                                      width: isAppNews
                                          ? getWidthScreen(context) / 2
                                          : getWidthScreen(context),
                                      height: 200,
                                      loadingPlaceholder: const LoaderWidget(),
                                      errorPlaceholder: SvgPicture.asset(
                                        Assets.images.aqaqeerLogo.path,
                                        // Fallback image
                                        width: getWidthScreen(context),
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  :*/
                        child: Image.asset(
                          Assets.images.aqaqeerLogo.path,
                          // Fallback image
                          width: getWidthScreen(context),
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                HtmlWidget(
                  //newsData?.content ??
                  "لا يوجد محتوى متاح",
                  textStyle: CustomTextStyle.bodyMedium(context),
                  onTapUrl: (url) async {
                    // return await _launchURL(url);
                    return await true;
                  },
                ),
                SizedBox(height: 20),
                // News Content
                Row(
                  children: [
                    CustomText(
                      text: "تاريخ النشر : ",
                      style: CustomTextStyle.bodyMedium(context),
                      maxLines: null, // Allow full text
                    ),
                    CustomText(
                      /*DateFormat('yyyy-MM-dd')
                                .format(newsData!.publishAt)*/
                      text: 'asdasdasd',
                      style: CustomTextStyle.bodyMedium(context),
                      maxLines: null, // Allow full text
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // if ((newsData.withActionButton) == 1 &&
                //     (newsData.routeToLink))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: CustomButton(
                      height: 50,
                      width: getWidthScreen(context) * 0.7,
                      onPressed: () {
                        // => _launchURL(newsData.link!)
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.open_in_new, color: AppColors.white),
                          const SizedBox(width: 8),
                          CustomText(
                            //newsData.buttonTitle ??
                            text: 'فتح الرابط',
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // if ((newsData.withActionButton) == 1 &&
                //     (newsData.routeToPage)&&newsData.hasPermission==true)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: CustomButton(
                      height: 50,
                      width: getWidthScreen(context) * 0.7,
                      onPressed: () {
                        // if (newsData.pageCode == 'MRQ') {
                        //   Navigator.pushNamed(
                        //       context, Routes.complaintsScreen);
                        // } else if (newsData.pageCode == 'ARQ') {
                        //   Navigator.pushNamed(
                        //       context, Routes.addNewRequestScreen);
                        // }  else if (newsData.pageCode == 'MPR') {
                        //   Navigator.pushNamed(context, Routes.personalProfileScreen);
                        // }  else if (newsData.pageCode == 'PRF') {
                        //   Navigator.pushNamed(context, Routes.preferencesScreen);                                }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.open_in_new,
                          //     color: AppColors.white),
                          // const SizedBox(width: 8),
                          // CustomText(
                          //   text: newsData.buttonTitle ??
                          //       'الإنتقال لصفحة ${newsData.page ?? ''}',
                          //   color: AppColors.white,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // (state.newsDetailState.isFail()) {
        //              return CustomPlaceholder(
        //                message: state.newsDetailState.error,
        //              );
        //            }
        // Container();}

        // Future<bool> _launchURL(String link) async {
        //   final url = Uri.parse(link);
        //   if (await canLaunchUrl(url)) {
        //     await launchUrl(url, mode: LaunchMode.platformDefault);
        //     return true;
        //   } else {
        //     debugPrint('Could not launch $url');
        //     return false;
        //   }
        // }
      ),
    );
  }
}
