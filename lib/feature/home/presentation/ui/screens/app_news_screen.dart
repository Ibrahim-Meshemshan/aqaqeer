import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_placeholder.dart';
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
        centerTitle: true,
        title: 'aasdasdأخبار التطبيق',
        fontColor: AppColors.black,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.lightGrey,
      // body: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      //     child: BlocProvider(
      //       create: (context) => locator.get<HomeBloc>(),
      //       child: BlocBuilder<HomeBloc, HomeState>(
      //         builder: (context, state) {
      //           if (state.newsStatus.isLoading()) {
      //             return const Center(child: CircularProgressIndicator());
      //           }
      //
      //           else if (state.newsStatus.isFail()) {
      //             return CustomPlaceholder(
      //               message: state.newsStatus.error,
      //             );
      //           } else if (state.newsStatus.isSuccess()) {
      //             return GridView.builder(
      //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2, // Two cards per row
      //                   crossAxisSpacing: 10,
      //                   mainAxisSpacing: 10,
      //                   // childAspectRatio: 1.2, // Adjust to fit your design
      //                 ), //appNews?.length ?? 0
      //                 itemCount: 2, // Adjust based on your data
      //                 itemBuilder: (context, index) {
      //                   return GestureDetector(
      //                     onTap: () {
      //                       // Navigator.push(
      //                       //   context,
      //                       //   MaterialPageRoute(
      //                       //     builder: (context) =>
      //                       //         NewsDetailScreen(appNews?[index].id ?? 0,isAppNews: true,),
      //                       //   ),
      //                       // );
      //                     },
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(10),
      //                           color: AppColors.transparent),
      //                       // height: 150,
      //                       // elevation: 3,
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Container(
      //                             width: double.infinity,
      //                             height: 120,
      //                             decoration: BoxDecoration(
      //                               color: Colors.white38,
      //                               borderRadius: const BorderRadius.only(
      //                                 topLeft: Radius.circular(10),
      //                                 topRight: Radius.circular(10),
      //                               ),
      //                             ),
      //                             // child: Image.asset(
      //                             //     Assets.images.aqaqeerLogo.path),
      //                             // child:   secureNetworkImage(
      //                             //   url:  AppUrl.baseUrl
      //                             //       .split('api')
      //                             //       .join(appNews?[index].imagePath ?? ''),
      //                             //   fit: BoxFit.fill,
      //                             //   errorPlaceholder:
      //                             //   SvgPicture.asset(
      //                             //     Assets.iconsNews,
      //                             //     // Fallback image
      //                             //     width: getWidthScreen(context),
      //                             //     // height: 200,
      //                             //     fit: BoxFit.contain,
      //                             //   ),
      //                             //   // width: 25,
      //                             //   // height: 25,
      //                             // ),
      //                             // width: 25,
      //                             // height: 25,
      //
      //                           ),
      //                           Expanded(
      //                             child: Container(
      //                               // height: 30,
      //                               color: Colors.white,
      //                               width: double.infinity,
      //                               padding: const EdgeInsets.all(8.0),
      //                               child: Center(
      //                                 child: Text(
      //                                   AppLocalizations.of(context)!.app_news,
      //                                   style: TextStyle(
      //                                     fontSize: 16,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //                                   textAlign: TextAlign.center,
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 }
      //
      //
      //             );
      //           }
      //           return Container();
      //         },
      //       ),
      //     )
      // ),
    );
  }
}


/*

             return Container();
                */