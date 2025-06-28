import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            child: CarouselSlider.builder(
              carouselController: _carouselController,
              //widget.citizenNews?.length ??
              itemCount: 1,
              options: CarouselOptions(
                viewportFraction: 1,
                disableCenter: true,
                autoPlay: false,
                enableInfiniteScroll: true,
                scrollPhysics:  const NeverScrollableScrollPhysics(),
                initialPage: 1,
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                onPageChanged: (index, reason) {
                  setState(() {
                    // _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, RoutesNames.newsScreen);
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
                              fontSize: 12,
                              text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد  ',
                              style: CustomTextStyle.bodyMedium(context, color: AppColors.white),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Indicator Dots
        ],
      ),
    );
  }
}
