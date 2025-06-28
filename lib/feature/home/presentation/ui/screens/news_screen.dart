import 'package:aqaqeer/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/widgets/app_bar/custom_app_bar.dart';



class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   context.read<HomeBloc>().add(GetCitizenNewsEvent());
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الأخبار',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.primaryGray,
      // body: BlocBuilder<HomeBloc, HomeState>(
      //   builder: (context, state) {
      //     if (state.citizenNewsState.isLoading()) {
      //       return const Center(child: LoaderWidget());
      //     }
      //     if (state.citizenNewsState.isSuccess()) {
      //       final citizenNews = state.citizenNewsState.model?.data ?? [];
      //       return Container(
              body:  ListView.builder(
                shrinkWrap: true,

                itemCount: 1, // Adjust based on your data
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NewsDetailScreen(
                        //       newsIndex: citizenNews[index].id,),
                        //   ),
                        // );
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
                              /*secureNetworkImage(
                                fit: BoxFit.contain,
                                url:  AppUrl.baseUrl
                                    .split('api')
                                    .join(citizenNews[index].imagePath),
                                height: 200,
                                // loadingPlaceholder: const LoaderWidget(),
                                errorPlaceholder:   SvgPicture.asset(
                                  Assets.iconsNews,
                                  // Fallback image
                                  width: getWidthScreen(context),
                                  // height: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                              )*/
                              child: Image.asset(Assets.images.aqaqeerLogo.path)
                            ),
                            Container(
                              // height: 30,
                              color: Colors.white,
                              width: double.infinity,
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'citizenNews[index].title',
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
          // if (state.citizenNewsState.isFail()) {
          //   return CustomPlaceholder(
          //     message: state.citizenNewsState.error,
          //   );
          // }
          // return Container();

  }

