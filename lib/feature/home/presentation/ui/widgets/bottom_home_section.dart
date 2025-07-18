import 'package:aqaqeer/core/bloc_status.dart';
import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:aqaqeer/feature/home/data/model/news_model.dart';
import 'package:aqaqeer/feature/home/presentation/state/home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../resources/assets.gen.dart';

class PharmacyNewsSection extends StatefulWidget {
  const PharmacyNewsSection({super.key});

  @override
  _PharmacyNewsSectionState createState() => _PharmacyNewsSectionState();
}

class _PharmacyNewsSectionState extends State<PharmacyNewsSection> {
  final CarouselSliderController _carouselController =
  CarouselSliderController();

// @override
//   void initState() {
//   context.read<HomeBloc>().add(FetchNews());
//   super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: AppLocalizations.of(context)!.highlights,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 160,
            width: getWidthScreen(context),
            child: BlocProvider(
              create: (context) => locator.get<HomeBloc>()..add(FetchNews()),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.newsStatus.isLoading()) {
                    return Center(child: CircularProgressIndicator());
                  }

                  else if (state.newsStatus.isFail()) {
                    return Center(child: Text(state.newsStatus.error ?? ''),);
                  }
                  else if (state.newsStatus.isSuccess()) {
                    return CarouselSlider.builder(
                      carouselController: _carouselController,
                      //widget.citizenNews?.length ??
                      itemCount: state.newsStatus.model?.data?.length,
                      options: CarouselOptions(
                        viewportFraction: 1,
                        disableCenter: true,
                        autoPlay: false,
                        enableInfiniteScroll: true,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        initialPage: 1,
                        autoPlayAnimationDuration: const Duration(
                            milliseconds: 1500),
                        onPageChanged: (index, reason) {
                          setState(() {
                            // _currentIndex = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        //state.newsStatus.model?.data![index]
                        final news = state.newsStatus.model?.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesNames.appNewsScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  scale: 2,
                                  alignment: Alignment.bottomLeft,
                                  image: AssetImage(
                                    Assets.images.aqaqeerLogo.path,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.lightPurple2,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 266,
                                    height: 91,
                                    child: CustomText(
                                      maxLines: 4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      text: news?.title ?? '',
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          // Indicator Dots
        ],
      ),
    );
  }
}
