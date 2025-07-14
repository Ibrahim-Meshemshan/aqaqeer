import 'package:aqaqeer/feature/home/data/model/news_details_model.dart';
import 'package:either_dart/either.dart';


import '../../../../core/common/network/failure.dart';
import '../../data/model/news_model.dart';


abstract class HomeRepository{
  Future<Either<Failure,NewsModel>> fetchNews();
  Future<Either<Failure,NewsDetailsModel>> fetchNewsDetails();
}