import 'dart:developer';
import 'package:aqaqeer/feature/home/data/model/news_details_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/network/dio/dio_client.dart';
import '../../../../../core/injection/injection.dart';
import '../../model/news_model.dart';


abstract class HomeRemote{

  Future<NewsModel> getNews();
  Future<NewsDetailsModel> getNewsDetails();

}

class HomeRemoteImp extends HomeRemote{

  DioClient dioClient = locator.get<DioClient>();
  // String? lang=locator.get<LanguageStorage>().getCurrentLang();

  @override
  Future<NewsModel> getNews() async{
    late final Response  response;
    response =await dioClient.get(
      url:AppUrl.getNews,
    );
    return NewsModel.fromJson(response.data);
  }

  @override
  Future<NewsDetailsModel> getNewsDetails() async{
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.getNewsDetails,
    );
    return NewsDetailsModel.fromJson(response.data);
  }
}
