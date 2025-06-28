import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../resources/assets.gen.dart';

class ServicesSectionItem extends StatefulWidget {
  ServicesSectionItem({super.key});

  @override
  State<ServicesSectionItem> createState() => _ServicesSectionItemState();
}

class _ServicesSectionItemState extends State<ServicesSectionItem> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: 210,
        child: CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: 2,
          options: CarouselOptions(
            viewportFraction: 1,
            disableCenter: true,
            autoPlay: false,
            //widget.appNews.length > 1
            enableInfiniteScroll: false,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            //widget.appNews.length == 1
            //                 ?
            //     : null,
            initialPage: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.drugs.path),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    height: 210,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.darkGreen.withValues(alpha: 0.7),
                          AppColors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 10),
                        AnimatedSmoothIndicator(
                          activeIndex: _currentIndex,
                          count: 1,
                          effect: ExpandingDotsEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                            activeDotColor: AppColors.white,
                            dotColor: Colors.grey.shade400,
                          ),
                          onDotClicked: (index) {
                            _carouselController.animateToPage(index);
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
