import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_placeholder.dart';
import '../../../../../core/common/widgets/image_widgets/secure_network_image.dart';
import '../../../../../resources/assets.gen.dart';
import '../../state/home_bloc.dart';
import 'news_detail_screen.dart';


class AppNewsScreen extends StatefulWidget {
  const AppNewsScreen({super.key});

  @override
  State<AppNewsScreen> createState() => _AppNewsScreenState();
}

class _AppNewsScreenState extends State<AppNewsScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<HomeBloc>().add(FetchNews());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icon(Icons.close, size: 30,),
        centerTitle: true,
        title: AppLocalizations.of(context)!.app_news,
        fontColor: AppColors.black,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.lightGrey,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: BlocProvider(
            create: (context) =>
            locator.get<HomeBloc>()..add(FetchNews()),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.newsStatus.isLoading()) {
                  return const Center(child: CircularProgressIndicator());
                }

                else if (state.newsStatus.isFail()) {
                  return CustomPlaceholder(
                    message: state.newsStatus.error,
                  );
                } else if (state.newsStatus.isSuccess()) {
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two cards per row
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9, // Adjust to fit your design
                      ),
                      //appNews?.length ?? 0
                      itemCount: state.newsStatus.model?.data?.length,
                      // Adjust based on your data
                      itemBuilder: (context, index) {
                        final appNews = state.newsStatus.model?.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailScreen(
                                      newsIndex: appNews?.id?.toInt() ?? 0,
                                      isAppNews: true,),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.transparent),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: getWidthScreen(context),
                                  // height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),

                                  child: secureNetworkImage(
                                    url: AppUrl.baseUrl
                                        .split('api')
                                        .join(appNews?.imagePath ?? ''),
                                    fit: BoxFit.fill,

                                    errorPlaceholder:
                                    SvgPicture.asset(
                                      Assets.images.aqaqeerLogo.path,
                                      width: getWidthScreen(context),
                                      height: 200,
                                      fit: BoxFit.fill,
                                    ),

                                  ),

                                ),
                                Expanded(
                                  child: Container(
                                    // height: 30,
                                    color: Colors.white,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        appNews?.title ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }


                  );
                }
                return Container();
              },
            ),
          )
      ),
    );
  }
}
