import 'dart:async';
import 'package:aqaqeer/feature/home/data/model/news_details_model.dart';
import 'package:either_dart/either.dart';
import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/netword_info.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/remote/home_remote.dart';
import '../model/news_model.dart';


class HomeRepoImp extends HomeRepository{
  final HomeRemote homeRemote;
  final NetworkInfo networkInfo;
  HomeRepoImp({required this.homeRemote,required this.networkInfo});
  @override
  Future<Either<Failure, NewsModel>> fetchNews() async {
    if (await networkInfo.isConnected) {
      try{
        NewsModel newsModel = await homeRemote.getNews();
        return Right(newsModel);
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, NewsDetailsModel>> fetchNewsDetails() async{
    if (await networkInfo.isConnected) {
      try{
        NewsDetailsModel newsDetailsModel = await homeRemote.getNewsDetails();
        return Right(newsDetailsModel);
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}