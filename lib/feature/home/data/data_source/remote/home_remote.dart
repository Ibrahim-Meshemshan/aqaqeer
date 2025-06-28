import 'package:dio/dio.dart';
import '../../../../../core/common/config/lang/state/store_current_lang.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/network/dio/dio_client.dart';
import '../../../../../core/injection/injection.dart';
import '../../model/news_model.dart';
abstract class HomeRemote{
  Future<NewsModel> getNews();
}

class HomeRemoteImp extends HomeRemote{

  DioClient dioClient=locator.get<DioClient>();
  // String? lang=locator.get<LanguageStorage>().getCurrentLang();

  @override
  Future<NewsModel> getNews() async{
    late final Response  response;
    response =await dioClient.get(url:AppUrl.getNews,params:  {"Category":'For-Employee',});
    return NewsModel.fromJson(response.data);
  }
}
