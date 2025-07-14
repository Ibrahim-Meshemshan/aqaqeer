import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_placeholder.dart';
import '../../../../../core/common/widgets/image_widgets/secure_network_image.dart';
import '../../state/home_bloc.dart';
import 'news_detail_screen.dart';


class AppNewsScreenNew extends StatefulWidget {
  const AppNewsScreenNew({super.key});

  @override
  State<AppNewsScreenNew> createState() => _AppNewsScreenNewState();
}

class _AppNewsScreenNewState extends State<AppNewsScreenNew> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   context.read<HomeBloc>().add(FetchNews());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.app_news,
          centerTitle: true,
          fontColor: AppColors.black,
          icon: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryGray,
        body: BlocProvider(
          create: (context) => locator.get<HomeBloc>()..add(FetchNews()),
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {

                if (state.newsStatus.isLoading()) {
                  return const Center(child: CircularProgressIndicator());
                }


                if (state.newsStatus.isSuccess()) {
                  final appNews = state.newsStatus.model?.data ?? [];
                  return Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: appNews.length, // Adjust based on your data
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailScreen(
                                    newsIndex: appNews[index].id!.toInt()),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.transparent),
                              // height: 150,
                              // elevation: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),

                                      child: secureNetworkImage(
                                        fit: BoxFit.contain,
                                        url:  AppUrl.baseUrl
                                            .split('api')
                                            .join(appNews[index].imagePath ?? ''),
                                        height: 200,
                                        // loadingPlaceholder: const LoaderWidget(),
                                        errorPlaceholder: Image.asset(
                                          Assets.images.aqaqeerLogo.path,
                                          // Fallback image
                                          width: getWidthScreen(context),
                                          // height: 200,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                  ),
                                  Container(
                                    // height: 30,
                                    color: Colors.white,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        appNews[index].title ?? '',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }

                if (state.newsStatus.isFail()) {
                  return Center(child: Text(state.newsStatus.error ?? ''));
                }
                return Container();
              }),
        ));
  }
}



