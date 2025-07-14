import 'package:aqaqeer/core/common/widgets/custom_texts/custom_text.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/feature/home/presentation/ui/widgets/static_center_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/image_widgets/secure_network_image.dart';
import '../../../../../core/routes/routes_names.dart';
import '../../../../../resources/assets.gen.dart';
import 'services_section_item.dart';

  class StaticsPharmacySection extends StatefulWidget {
  const StaticsPharmacySection({super.key});

  @override
  State<StaticsPharmacySection> createState() => _StaticsPharmacySectionState();
}

class _StaticsPharmacySectionState extends State<StaticsPharmacySection> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StaticCenterCard(text: AppLocalizations.of(context)!.requests,icon: FontAwesomeIcons.codePullRequest,),
              SizedBox(height: 10),
              StaticCenterCard(text: AppLocalizations.of(context)!.services,icon: FontAwesomeIcons.servicestack),
            ],
          ),
          SizedBox(width: 2),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.appNewsScreen);
              },
              child: ServicesSectionItem(),
            ),
          ),
        ],
      ),
    );
  }



// Widget StaticCenterCard(BuildContext context,String text,IconData icon){
//     return GestureDetector(
//       onTap: () {
//
//       },
//       child: Card(
//         elevation: 2,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: AppColors.white,
//           ),
//           width: getWidthScreen(context) / 2.6,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Row(
//                 children: [
//                   Icon(icon),
//                   const SizedBox(width: 5),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: CustomText(
//                       text: text,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       style: CustomTextStyle.titleMedium(
//                         context,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: CustomText(
//                   text: '5',
//                   style: CustomTextStyle.bodyLarge(context),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
// }



}
