// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../core/common/config/theme/src/colors.dart';
// import '../../../../resources/assets.gen.dart';
//
// class BodySplash extends StatelessWidget {
//   const BodySplash({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: AppColors.white,
//       resizeToAvoidBottomInset: false, // Prevent widgets from getting too close when keyboard is open
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//
//             Expanded(
//               child: Stack(
//                 children: <Widget>[
//                   Align(
//                     alignment: FractionalOffset.center,
//                     child: FadeInDownBig(
//                       duration: const Duration(milliseconds: 1000),
//                       child: SizedBox(
//                         width: 150,
//                         child: SvgPicture.asset(Assets.icons.mainLogo.path,   width: 150,
//                           fit: BoxFit.fill,),
//
//                         // SvgPicture.asset(
//                         //  Assets.iconsMainLogo,
//                         //   width: 150,
//                         //   fit: BoxFit.fill,
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: FadeInUpBig(
//                         duration: const Duration(milliseconds: 500),
//                         child: SizedBox(
//                           width: 200,
//                           child: SvgPicture.asset(
//                             Assets.images.aqaqeerLogo.path,
//                             width: 200,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: FadeInUpBig(
//                         duration: const Duration(milliseconds: 500),
//                         child: SizedBox(
//                           width: 200,
//                           child: SvgPicture.asset(
//                             Assets.icons.iconOtp,
//                             fit: BoxFit.fill,
//                             width: 200,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Positioned(
//                   //   child: Align(
//                   //     alignment: Alignment.bottomCenter,
//                   //     child: FadeInUpBig(
//                   //       duration: const Duration(milliseconds: 500),
//                   //       child: Container(
//                   //         padding: EdgeInsets.only(bottom: 20),
//                   //         width: 200,
//                   //         child: Image.asset(
//                   //           color: AppColors.black,
//                   //           Assets.imagesAutomataIntro,
//                   //           width: 200,
//                   //           fit: BoxFit.fill,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
