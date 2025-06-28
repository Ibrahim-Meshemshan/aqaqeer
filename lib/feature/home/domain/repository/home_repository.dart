import 'package:either_dart/either.dart';


import '../../../../core/common/network/failure.dart';
import '../../data/model/news_model.dart';


abstract class HomeRepository{
  Future<Either<Failure,NewsModel>> fetchNews();
}